# Project - fantasy_baseball 
### written by Chris McNabb  => Mar 03, 2014
 
=================================
 
# OVERALL DESCRIPTION
>
> ## Fantasy Baseball Statistics - "Play Ball!"
>
> ## This is a Ruby CLI program for computing baseball statistics.
>
> The program runs and performs the following:
>
> 1.   Reads data into the program from input CSV files
>
> 2.   Computes statistics based on the Customer Specifications (see below)
>
> 3.   Outputs the aggregated statistics to the screen (STDOUT) for user to view
>
>
# USAGE
>
> ### To run:
>
     $ ./bin/play_ball
>

# INSTALLATION
>
> NOTE: In order to simplify the installation burden, these steps would normally be wrapped up in a rake task.  This was not done due to time constraints. Here are the manual instructions.
>
> Step 1: Clone repo
>
     $ git clone git@github.com:chrismcnabbsoftwaredeveloper/fantasy_baseball.git
>

> Step 2: Setup logging* - add this entry to /etc/syslog.conf
>
     local5.* /var/log/fantasy_baseball.log
>

> *Note: these steps are for Mac OSX. These steps will most certainly be different depending on your production environment.
>
> Step 3: Stop/Start syslogd daemon
>
     $ sudo launchctl unload /System/Library/LaunchDaemons/com.apple.syslogd.plist
>
     $ sudo launchctl load /System/Library/LaunchDaemons/com.apple.syslogd.plist
>

> Step 4: Change execute permissions on play_ball file
>
     $ chmod +x bin/play_ball
>

> Step 5: Setup/Verify input data files - configuration.rb
>
> By default, the csv input data files are located in the /data/ directory of the project.  However, this is configurable.  You will configure the file location in the following configuration file:
>
     $ ../config/configuration.rb
>

> For example,
>
     Configuration.for('batting_input_file') {
       file_name 'data/Batting-07-12.csv'
       }
>

> Step 6: Now to run the program,
>
     $ ./bin/play_ball
>


# LOGGING
>
> ## SYSLOG
> Standard logging to syslog, for production log aggregation, is included in this code base.  By default here, we are writing to the following log file on Mac OS X.  You will note in the installation instructions above, the setup and configuration for this syslog log file.  In a normal production environment, this logging configuration will be similar, but different based on the version of Linux used.
>
     $ /var/log/fantasy_baseball.log
>

> Logging example:
>
     Mar  8 03:54:09 L1037-2.local FantasyBaseball[65948]: File Import Failed => file_path = /Users/christopher.mcnabb/Developer/git/fantasy_baseball/data/Batting-pre-processed.csv Exception Message: #<TypeError: can't convert Symbol into Integer>
>


# CUSTOMER SPECIFICATIONS
>
> Specification 1: Display data for "Most Improved Batting Average from 2009 to 2010."
>
> Specification 2: Display data for "Slugging Percentage for All Oakland A's Players in 2007."
>
> Specification 3: Display data for "The Triple Crown Winner for 2001 and 2012 for both the AL and the NL"
>
> Details regarding these customer specifications can be found in the spec doc located in the /doc/ folder of the project.
>
     $ ../doc/FantasyBaseballRequirements.doc
>



