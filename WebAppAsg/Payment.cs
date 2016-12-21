namespace Assignment
{
    using System;
    using System.Data.Entity;
    using System.Linq;
    

    public class PaymentT 
    {
        
        private string myReservationID;
        private string myPaymentID;
        private double myTotalAmount;
        private string myPlateNumber;
        private string myOrigin;
        private string myDestination;
        private DateTime myReservationDateTime;
        private DateTime myPickUpDateTime;
        private string myDriveName;
        private string myPickUpAddress;
        private string myCarModel;

        public PaymentT()
           
        {
            myReservationID = "";
            myPaymentID = "";
            myTotalAmount = 0;
            myPlateNumber = "";
            myOrigin = "";
            myDestination = "";
            myReservationDateTime = System.DateTime.Today;
            myPickUpDateTime = System.DateTime.Today;
            myDriveName = "";
            myPickUpAddress = "";
            myCarModel = "";
        }

        public string ReservationID
        {
            get { return this.myReservationID; }
            set { this.myReservationID = value; }
        }

        public string PaymentID
        {
            get { return this.myPaymentID; }
            set { this.myPaymentID = value; }
        }

        public string PlateNumber
        {
            get { return this.myPlateNumber; }
            set { this.myPlateNumber = value; }
        }

        public string Origin
        {
            get { return this.myOrigin; }
            set { this.myOrigin = value; }

        }

        public string Destination
        {
            get { return this.myDestination; }
            set { this.myDestination = value; }
        }

        public DateTime ReservationDateTime
        {
            get { return this.myReservationDateTime; }
            set { this.myReservationDateTime = value; }
        }

        public DateTime PickUpDateTime
        {
            get { return this.myPickUpDateTime; }
            set { this.myPickUpDateTime = value; }
        }

        public double TotalAmount
        {
            get { return this.myTotalAmount; }
            set { this.myTotalAmount = value; }
        }

        public string DriverName
        {
            get { return this.myDriveName;}
            set { this.myDriveName = value;}
        }

        public string PickUpAddress{
            get { return this.myPickUpAddress;}
            set { this.myPickUpAddress = value;}
        }

        public string CarModel{
            get { return this.myCarModel;}
            set { this.myCarModel = value;}
        }

       
    }

   
}