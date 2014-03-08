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
> 1.   Reads in the data from csv files
>
> 2.   Computes statistics based on the requirements
>
> 3.   Outputs the aggregated statistics to the screen (STDOUT)
>
>
# USAGE
>
> ### To run:
>
     $ ./bin/play_ball
>

# Installation
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
> Standard logging to syslog, for production log aggregation, is included in this code base.  By default here, we are writing to the following log file on Mac OS X.  You will note in the installation instructions above, the setup and configuration for this syslog log file.  In a normal production environment, this logging configuration will be similar, but different based on the version of Linux used.
>
     $ /var/log/fantasy_baseball.log
>



