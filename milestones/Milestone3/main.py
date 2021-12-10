# bot.py
# This file is intended to be a "getting started" code example for students.
# The code in this file is fully functional.
# Students are free to edit the code in the milestone 3 folder.
# Students are NOT allowed to distribute this code without the express permission of the class instructor
# IMPORTANT: How to set your secret environment variables? read README guidelines.

# imports
import os
import discord
import database as db
import pandas as pd
from tabulate import tabulate

#import sys
# environment variables
token = os.environ['DISCORD_TOKEN']
server = os.environ['DISCORD_GUILD']
#server_id = os.environ['SERVER_ID']  # optional
#channel_id = os.environ['CHANNEL_ID']  # optional

# database connection
# secret keys related to your database must be updated. Otherwise, it won't work
db_conn = db.connect()
# bot events
client = discord.Client()


@client.event
async def on_ready():
    """
    This method triggers with the bot connects to the server
    Note that the sample implementation here only prints the
    welcome message on the IDE console, not on Discord
    :return: VOID
    """
    print("{} has joined the server".format(client.user.name))


@client.event
async def on_message(message):
    """
    This method triggers when a user sends a message in any of your Discord server channels
    :param message: the message from the user. Note that this message is passed automatically by the Discord API
    :return: VOID
    """
    response = None # will save the response from the bot
    if message.author == client.user:
        return # the message was sent by the bot
    if message.type is discord.MessageType.new_member:
        response = "Welcome {}".format(message.author) # a new member joined the server. Welcome him.
    else:
        msg = message.content.lower()
      
        tmp = msg.split(' ')
        args = []
        for i in range(0,len(tmp)): 
          args.append(tmp[i])
        print(args);

        if "milestone3" in msg:
            response = "I am alive. Signed: 'your bot'"
        elif "/get-patients" in msg:
          # response = db.getPatients(db_conn);
          patientList = db.getPatients(db_conn)
          df = pd.DataFrame(patientList)
          response = tabulate(df, headers = 'keys', tablefmt = 'fancy_grid', showindex = "never")
          title = "Patients"
          print(response)
        elif "/get-pharmacy-sales-all-contracts" in msg:
          #response = db.getPharmacySales(db_conn)
          contractList = db.getPharmacySales(db_conn)
          df = pd.DataFrame(contractList)
          response = tabulate(df, headers = 'keys', tablefmt = 'fancy_grid', showindex = "never")
          title = "Pharmacy Sales"
          print(response)
        elif "/get-patient-appointments hcp procedure " + args[3] + " & " + args[5] in msg:
          #response = db.getPreviousAppointments(db_conn, args[3], args[5])
          apptList = db.getPreviousAppointments(db_conn, args[3], args[5])
          df = pd.DataFrame(apptList)
          response = tabulate(df, headers = 'keys', tablefmt = 'fancy_grid', showindex = "never")
          title = "Appointments"
        elif "/get-procedures-average-age patients > " + args[3] + " prescriptions > " + args[6] in msg:
          #response = db.getProceduresAndPrescriptions(db_conn, args[3], args[6])
          procedureList = db.getProceduresAndPrescriptions(db_conn, args[3], args[6])
          df = pd.DataFrame(procedureList)
          response = tabulate(df, headers = 'keys', tablefmt = 'fancy_grid', showindex = "never")
          title = "Procedures"
          print(response)
        elif "/get-pharmacy-sales medicines < " + args[3] + " " + args[4] + " & " + args[6] in msg:
          #response = db.getMedicines(db_conn, args[3], args[4], args[6])
          salesMedicineList = db.getMedicines(db_conn, args[3], args[4], args[6])
          df = pd.DataFrame(salesMedicineList)
          response = tabulate(df, headers = 'keys', tablefmt = 'fancy_grid', showindex = "never")
          title = "Medicines"
          print(response)
        elif "/get-account-profiles insurance " + args[2] + " & " + args[4] + " payments > " + args[7] in msg:
          accountsList = db.getAccountProfiles(db_conn, args[2], args[4] , args[7])
          #response = db.getAccountProfiles(db_conn, args[2], args[4] , args[7])
          df = pd.DataFrame(accountsList)
          response = tabulate(df, headers = 'keys', tablefmt = 'fancy_grid', showindex = "never")
          title = "Account Profiles"
          print(response)
        elif "/get-patient-age average " + args[2] + " < procedures " + args[5] + " < testing" in msg:
          # response = db.getAverageAgeProceduresAndTest(db_conn, args[2], args[5])
          patientAgeList = db.getAverageAgeProceduresAndTest(db_conn, args[2], args[5])
          df = pd.DataFrame(patientAgeList)
          response = tabulate(df, headers = 'keys', tablefmt = 'fancy_grid', showindex = "never")
          title = "Average Patient Age"
          print(response)
        elif "/get-contracts " + args[1] + " & " + args[3] + " company > " + args[6] + " sales " + args[8] + " & " + args[10] in msg:
          #response = db.getContracts(db_conn, args[1], args[3], args[6], args[8], args[10])
          contractList = db.getContracts(db_conn, args[1], args[3], args[6], args[8], args[10])
          df = pd.DataFrame(contractList)
          response = tabulate(df, headers = 'keys', tablefmt = 'fancy_grid', showindex = "never")
          title = "Contracts"
          print(response)
        elif "/get-phone-numbers clinics nurses start " + args[4] + " & " + args[6] + " hcp procedures > " + args[10] in msg:
          #response = db.getClinicPhoneNumbers(db_conn, args[4], args[6], args[10])
          phoneNumberList = db.getClinicPhoneNumbers(db_conn, args[4], args[6], args[10])
          df = pd.DataFrame(phoneNumberList)
          response = tabulate(df, headers = 'keys', tablefmt = 'fancy_grid', showindex = "never")
          title = "Phone Numbers of Clinics"
          print(response)

    if response:
        # bot sends response to the Discord API and the response is show
        # on the channel from your Discord server that triggered this method.
        #embed = discord.Embed(description=response)
        embed = discord.Embed(title = title, description='```\n'+ response + '```')
        await message.channel.send(embed=embed)


try:
    # start the bot and keep the above methods listening for new events
    client.run(token)
except:
    print("Bot is offline because your secret environment variables are not set. Head to the left panel, " +
          "find the lock icon, and set your environment variables. For more details, read the README file in your " +
          "milestone 3 repository")