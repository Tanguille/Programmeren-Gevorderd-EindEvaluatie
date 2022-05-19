using Domein;
using Domein.Exceptions;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;

namespace Persistentie {
    public class ReservationRepo : IReservationRepo {
        private static string _connectionString;

        public ReservationRepo(string connectionstring) {
            _connectionString = connectionstring;
        }

        /// <summary>
        /// Selecteert een reservatie met al zijn data uit de database voor een overzicht aan klant te geven
        /// </summary>
        /// <returns>Reservatie</returns>       
        public List<Reservatie> GeefReservaties(int klantNummer) {
            try {
                KlantRepo klantRepo = new(_connectionString);
                ToestelRepo toestelRepo = new(_connectionString);
                List<Reservatie> reservaties = new List<Reservatie>();

                Klant klant = klantRepo.SelecteerKlantData(klantNummer.ToString());

                using SqlConnection connection = new(_connectionString);
                connection.Open();

                SqlCommand sqlCommand = new("SELECT * FROM Reservatie WHERE KlantNummer = @klantNummer ORDER BY Datum DESC, BeginSlot DESC", connection);
                sqlCommand.Parameters.AddWithValue("@klantNummer", klantNummer);

                using SqlDataReader dataReader = sqlCommand.ExecuteReader();
                if (dataReader.HasRows) {
                    while (dataReader.Read()) {
                        int reservatieNummer = (int)dataReader["ReservatieNummer"];

                        int fitnessToestelID = (int)dataReader["FitnessToestelID"];
                        FitnessToestel toestel = toestelRepo.SelecteerToestelData(fitnessToestelID, "");

                        DateTime datum = (DateTime)dataReader["Datum"];
                        int beginSlot = (int)dataReader["BeginSlot"];
                        int aantalSlots = (int)dataReader["AantalSlots"];

                        reservaties.Add(new Reservatie(reservatieNummer, datum, klant, toestel, beginSlot, aantalSlots));
                    }
                    return reservaties;
                }
                else {
                    throw new RepoException("Geen overeenkomstige data in de databank.");
                }
            }
            catch (RepoException e) {
                throw new RepoException("Reservaties uit databank halen ging mis", e);
            }
        }

        /// <summary>
        /// Zet reservatie in database
        /// </summary>  
        public void ZetReservatieInDB(Reservatie reservatie) {
            try {
                using SqlConnection connection = new(_connectionString);
                connection.Open();

                SqlCommand insertCommand = new("INSERT INTO Reservatie (KlantNummer, FitnessToestelID, Datum, BeginSlot, AantalSlots) "
                + "VALUES (@KlantNummer, @FitnessToestelID, @Datum, @BeginSlot, @AantalSlots)", connection);
                insertCommand.Parameters.AddWithValue("@KlantNummer", reservatie.Klant.KlantNummer);
                insertCommand.Parameters.AddWithValue("@FitnessToestelID", reservatie.GereserveerdToestel.ToestelID);
                insertCommand.Parameters.AddWithValue("@Datum", reservatie.Datum);
                insertCommand.Parameters.AddWithValue("@BeginSlot", reservatie.BeginSlot);
                insertCommand.Parameters.AddWithValue("@AantalSlots", reservatie.AantalSlots);

                insertCommand.ExecuteNonQuery();
                connection.Close();
            }
            catch (RepoException e) {
                throw new RepoException("Fout bij reservatie in Databank steken.", e);
            }
        }
    }
}
