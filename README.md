# Hospital Database Management System
This project is a Hospital Database Management System implemented using SQL Server. It provides a platform to manage patient records, doctor information, medical examinations, accounts, bed assignments, and related data within a hospital setting.

## Database Structure
The Hospital database consists of the following tables:

- Patients: Stores patient information including their ID, first name, last name, date of birth, gender, street, city, and home phone number.
- Doctors: Contains information about doctors including their ID, first name, last name, specialty, office phone number, and mobile number.
- Examines: Tracks medical examinations conducted by doctors. It includes the doctor's ID, patient's ID, examination date, examination time, diagnosis, and examination fee.
- Accounts: Manages patient accounts and billing information. It stores the patient's ID, admission date, discharge date, and total amount.
- Beds: Keeps track of bed information in the hospital. It includes the room number, bed number, bed type, and status (occupied or available).
- BedCosts: Stores the cost per hour for different bed types.
- Bed_Assignment: Manages bed assignments for patients. It includes the patient's ID, room number, bed number, admission date, admission time, discharge date, discharge time, and amount.
## Getting Started
To set up the Hospital Database Management System:

- Create a new database named "hospital" in your SQL Server instance.
- Execute the SQL scripts provided in the previous message to create the necessary tables and insert sample data.
## Usage
Once the database is set up, you can use SQL queries to perform various operations such as:

- Retrieving patient information, doctor details, and examination records.
- Managing patient accounts and generating billing information.
- Tracking bed assignments and availability.
- Analyzing data by performing queries and generating reports.

Feel free to explore the tables, execute SQL queries, and customize the system as per your requirements.

## Future Enhancements
Here are some potential areas for future enhancements to the Hospital Database Management System:

- Adding additional tables and fields to accommodate more detailed patient information.
- Implementing user authentication and access control for secure data management.
- Developing a user-friendly interface using ASP.NET and C# to interact with the database.
- Integrating with external systems such as billing systems or electronic health records (EHR) for seamless data exchange.

Please note that these enhancements require further development and customization based on specific project needs.

### License
This project is open-source and available under the MIT License. Feel free to use, modify, and distribute it according to the license terms.
