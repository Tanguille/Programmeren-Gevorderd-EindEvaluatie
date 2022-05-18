using Domein;
using Domein.Exceptions;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;

namespace Persistentie {
    public class ReservationRepo : IReservationRepo {
        private readonly string _connectionstring;

        public ReservationRepo(string connectionstring) {
            _connectionstring = connectionstring;
        }

        /// <summary>
        /// Selecteert een reservatie met al zijn data uit de database voor een overzicht aan klant te geven
        /// </summary>
        /// <returns>Reservatie</returns>
        /// TODO: Implementeren!
        public List<Reservatie> GeefReservaties(int klantNummer) {
            try {
                List<Reservatie> reservaties = new List<Reservatie>();

                using SqlConnection connection = new(_connectionstring);
                connection.Open();

                SqlCommand sqlCommand = new("SELECT * FROM Reservatie WHERE KlantNummer = @klantNummer", connection);
                sqlCommand.Parameters.AddWithValue("@klantNummer", klantNummer);
                //Hoe fiksen om list op te vangen?

                using SqlDataReader dataReader = sqlCommand.ExecuteReader();
                if (dataReader.HasRows) {
                    while (dataReader.Read()) {

                        //reservaties.Add(new Reservatie());
                    }
                }

                throw new NotImplementedException();
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
                using SqlConnection connection = new(_connectionstring);
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
