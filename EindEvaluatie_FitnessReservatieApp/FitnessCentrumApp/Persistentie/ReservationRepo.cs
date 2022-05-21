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
        /// Selecteert alle Reservaties met al hun data uit de database.
        /// </summary>
        /// <returns>Reservatie</returns>       
        public List<Reservatie> GeefReservatiesVanafVandaag() {
            try {
                KlantRepo klantRepo = new(_connectionString);
                ToestelRepo toestelRepo = new(_connectionString);
                List<Reservatie> Reservaties = new();

                using SqlConnection connection = new(_connectionString);
                connection.Open();

                SqlCommand sqlCommand = new("SELECT * FROM Reservatie WHERE Datum >= CAST( GETDATE() AS Date) ORDER BY Datum DESC, BeginSlot DESC", connection);

                using SqlDataReader dataReader = sqlCommand.ExecuteReader();
                if (dataReader.HasRows) {
                    while (dataReader.Read()) {
                        int ReservatieNummer = (int)dataReader["ReservatieNummer"];

                        int klantNummer = (int)dataReader["KlantNummer"];
                        Klant klant = klantRepo.SelecteerKlantData(klantNummer.ToString());

                        int ReservatieID = (int)dataReader["ReservatieID"];
                        FitnessToestel toestel = toestelRepo.SelecteerToestelData(ReservatieID, "");

                        DateTime datum = (DateTime)dataReader["Datum"];
                        int beginSlot = (int)dataReader["BeginSlot"];
                        int aantalSlots = (int)dataReader["AantalSlots"];

                        Reservaties.Add(new Reservatie(ReservatieNummer, datum, klant, toestel, beginSlot, aantalSlots));
                    }
                    return Reservaties;
                }
                else {
                    throw new RepoException("Deze gegevens staan niet in de databank.");
                }
            }
            catch (RepoException e) {
                throw new RepoException("Reservaties uit databank halen ging mis", e);
            }
        }

        /// <summary>
        /// Selecteert alle Reservaties met al hun data uit de database voor een overzicht aan klant te geven
        /// </summary>
        /// <returns>Reservatie</returns>       
        public List<Reservatie> GeefReservatiesOpKlantNummer(int klantNummer) {
            try {
                KlantRepo klantRepo = new(_connectionString);
                ToestelRepo toestelRepo = new(_connectionString);
                List<Reservatie> Reservaties = new();

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

                        Reservaties.Add(new Reservatie(reservatieNummer, datum, klant, toestel, beginSlot, aantalSlots));
                    }
                    return Reservaties;
                }
                else {
                    //Zorgt ervoor dat ik kan checken hoeveel Reservaties er reeds gemaakt zijn op bepaalde dag.
                    return Reservaties;
                }
            }
            catch (RepoException e) {
                throw new RepoException("Reservaties uit databank halen ging mis", e);
            }
        }

        /// <summary>
        /// Zet Reservatie in database
        /// </summary>  
        public void ZetReservatieInDB(Reservatie reservatie) {
            try {
                using SqlConnection connection = new(_connectionString);
                connection.Open();

                SqlCommand insertCommand = new("INSERT INTO Reservatie (KlantNummer, ReservatieID, Datum, BeginSlot, AantalSlots) "
                + "VALUES (@KlantNummer, @ReservatieID, @Datum, @BeginSlot, @AantalSlots)", connection);
                insertCommand.Parameters.AddWithValue("@KlantNummer", reservatie.Klant.KlantNummer);
                insertCommand.Parameters.AddWithValue("@ReservatieID", reservatie.GereserveerdToestel.ToestelID);
                insertCommand.Parameters.AddWithValue("@Datum", reservatie.Datum);
                insertCommand.Parameters.AddWithValue("@BeginSlot", reservatie.BeginSlot);
                insertCommand.Parameters.AddWithValue("@AantalSlots", reservatie.AantalSlots);

                insertCommand.ExecuteNonQuery();
                connection.Close();
            }
            catch (RepoException e) {
                throw new RepoException("Fout bij Reservatie in Databank steken.", e);
            }
        }
    }
}
