using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

    //Add MySql Library
    using MySql.Data.MySqlClient;
    
   namespace SavageWorlds
   {
       class DBConnect
       {
           private MySqlConnection connection;
           private string server;
           private string database;
           private string uid;
           private string password;
   
           //Constructor
           public DBConnect()
           {
               Initialize();
           }
   
           //Initialize values
           private void Initialize()
           {
               server = "localhost";
               database = "savageworlds";
               uid = "root";
               password = "";
               string connectionString;
               connectionString = "SERVER=" + server + ";" + "DATABASE=" + database + ";" + "UID=" + uid + ";" + "PASSWORD=" + password + ";";
   
               connection = new MySqlConnection(connectionString);
           }
   
   
           //open connection to database
           private bool OpenConnection()
          {
               try
               {
                  connection.Open();
                   return true;
              }
               catch (MySqlException ex)
               {
                   //When handling errors, you can your application's response based on the error number.
                   //The two most common error numbers when connecting are as follows:
                  //0: Cannot connect to server.
                  //1045: Invalid user name and/or password.
                  switch (ex.Number)
                   {
                      case 0:
                           HttpContext.Current.Response.Write(@"<script language='javascript'>alert('Cannot connect to server.  Contact administrator');</script");
                          break;
                       case 1045:
                           HttpContext.Current.Response.Write(@"<script language='javascript'>alert('Invalid username/password, please try again');</script");
                          break;
                   }
                   return false;
               }
           }
   
           //Close connection
           private bool CloseConnection()
           {
               try
               {
                   connection.Close();
                   return true;
               }
               catch (MySqlException ex)
               {
                 HttpContext.Current.Response.Write(@"<script language='javascript'>alert('" + ex.Message + "');</script");
                   return false;
               }
           }

           public List<string>[] Select(String run)
           {
               string query = run;

               //Create a list to store the result
               List<string>[] list = new List<string>[0];

               //Open connection
               if (this.OpenConnection() == true)
               {
                   //Create Command
                   MySqlCommand cmd = new MySqlCommand(query, connection);
                   //Create a data reader and Execute the command
                   MySqlDataReader dataReader = cmd.ExecuteReader();


                   list = new List<string>[dataReader.VisibleFieldCount];
                   for(int i = 0; i < dataReader.VisibleFieldCount; i++)
                       list[i] = new List<string>();

                   //Read the data and store them in the list
                   while (dataReader.Read())
                   {
                       for (int i = 0; i < dataReader.VisibleFieldCount; i++)
                           list[i].Add(dataReader[i] + "");
                   }

                   //close Data Reader
                   dataReader.Close();

                   //close Connection
                   this.CloseConnection();

                   //return list to be displayed
                   return list;
               }
               else
               {
                   return list;
               }
           }

   /*
           //Insert statement
           public void Insert()
           {
               string query = "INSERT INTO tableinfo (name, age) VALUES('John Smith', '33')";
   
               //open connection
               if (this.OpenConnection() == true)
               {
                  //create command and assign the query and connection from the constructor
                   MySqlCommand cmd = new MySqlCommand(query, connection);
                   
                  //Execute command
                   cmd.ExecuteNonQuery();
   
                   //close connection
                   this.CloseConnection();
               }
          }
  
          //Update statement
          public void Update()
          {
              string query = "UPDATE tableinfo SET name='Joe', age='22' WHERE name='John Smith'";
  
              //Open connection
              if (this.OpenConnection() == true)
              {
                  //create mysql command
                  MySqlCommand cmd = new MySqlCommand();
                  //Assign the query using CommandText
                  cmd.CommandText = query;                  //Assign the connection using Connection
                  cmd.Connection = connection;
  
                  //Execute query
                  cmd.ExecuteNonQuery();
  
                  //close                
                  this.CloseConnection();
             }
  
          //Delete statement
          public void Delete()
          {
              string query = "DELETE FROM tableinfo WHERE name='John Smith'";
  
              if (this.OpenConnection() == true)
              {
                  MySqlCommand cmd = new MySqlCommand(query, connection);
                  cmd.ExecuteNonQuery();
                  this.CloseConnection();
              }
          }
  
          //Select statement
          public List<string>[] Select()
          {
              string query = "SELECT * FROM tableinfo";
  
              //Create a list to store the result
              List<string>[] list = new List<string>[3];
              list[0] = new List<string>();
              list[1] = new List<string>();
              list[2] = new List<string>();
  
              //Open connection
              if (this.OpenConnection() == true)
              {
                  //Create Command
                  MySqlCommand cmd = new MySqlCommand(query, connection);
                  //Create a data reader and Execute the command
                  MySqlDataReader dataReader = cmd.ExecuteReader();
                  
                  //Read the data and store them in the list
                  while (dataReader.Read())
                  {
                      list[0].Add(dataReader["id"] + "");
                      list[1].Add(dataReader["name"] + "");
                      list[2].Add(dataReader["age"] + "");
                  }
  
                  //close Data Reader
                  dataReader.Close();
  
                  //close Connection
                  this.CloseConnection();
  
                  //return list to be displayed
                  return list;
              }
              else
              {
                  return list;
              }
          }
  
          //Count statement
          public int Count()
          {
              string query = "SELECT Count(*) FROM tableinfo";
              int Count = -1;
  
              //Open Connection
              if (this.OpenConnection() == true)
              {
                  //Create Mysql Command
                  MySqlCommand cmd = new MySqlCommand(query, connection);
  
                  //ExecuteScalar will return one value
                  Count = int.Parse(cmd.ExecuteScalar()+"");
                  
                  //close Connection
                  this.CloseConnection();
  
                  return Count;
              }
              else
              {
                  return Count;
              }
          }
  */
      }
  }
  