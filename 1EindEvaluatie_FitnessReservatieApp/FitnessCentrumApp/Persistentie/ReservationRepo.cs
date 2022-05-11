using Domein;
using Microsoft.Data.SqlClient;
using System;

namespace Persistentie {
    public class ReservationRepo : IReservationRepo {
        private readonly string _connectionstring;
        private readonly Klant _aangemeldeKlant;
        private readonly FitnessToestel _fitnessToestel;
        private readonly Reservatie _reservatie;

        public ReservationRepo(string connectionstring) {
            _connectionstring = connectionstring;
        }

        /// <summary>
        /// Selecteert een reservatie met al zijn data uit de database voor een overzicht aan klant te geven
        /// </summary>
        /// <returns>Reservatie</returns>
        public Reservatie SelecteerReservaties(int klantNummer) {
            try {
                throw new NotImplementedException();
            }
            catch (Exception e) {

                throw new Exception();
            }
        }

        /// <summary>
        /// Zet reservatie in database
        /// </summary>  
        public void ZetReservatieInDB(Reservatie reservatie) {
            try {
                using SqlConnection connection = new(_connectionstring);
                connection.Open();

                SqlCommand insertCommand = new("INSERT INTO Reservatie (KlantNummer, FitnessToestelID, Datum, BeginSlot, AantalSlots "
                    + "VALUES (@KlantNummer, @FitnessToestelID, @Datum, @BeginSlot, @AantalSlots);", connection);
                insertCommand.Parameters.AddWithValue("@KlantNummer", _aangemeldeKlant.KlantNummer);
                insertCommand.Parameters.AddWithValue("@FitnessToestelID", _fitnessToestel.ToestelID);
                insertCommand.Parameters.AddWithValue("@Datum", _reservatie.Datum);
                insertCommand.Parameters.AddWithValue("@BeginSlot", _reservatie.BeginSlot);
                insertCommand.Parameters.AddWithValue("@AantalSlots", _reservatie.AantalSlots);

                insertCommand.ExecuteNonQuery();
                connection.Close();
            }
            catch (Exception e) {
                throw new Exception("Fout bij reservatie in Databank steken.", e);
            }
        }

        public bool ToestelBeschikbaar(int toestelID) {
            throw new NotImplementedException();
        }
    }
}
