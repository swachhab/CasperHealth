# Importing required libraries
import os, datetime, sys
import configparser

# Setting Variables, required paths
Project_dir = (os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
Tests_dir = os.path.join(Project_dir, "TestCases")
Results_dir = os.path.join(Project_dir, "Results")
# New report directory name
dir_name = datetime.datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
# Select test cases
ConfigParser = configparser.RawConfigParser()
configFilePath = os.path.join(Project_dir, "Batch","test_selector.ini")
ConfigParser.read(configFilePath)

# Create Result directory if not there
if not os.path.exists(Results_dir):
	os.makedirs(Results_dir)
Reports_dir = os.path.join(Project_dir, Results_dir, dir_name)
os.makedirs(Reports_dir)

# Settings Variables
total_tc = {}
active_tc = []

# Getting Test Cases from Config file
total_tc = dict(ConfigParser.items('Test Cases'))

# Find test cases to run
for key, value in total_tc.items():
	if str(value) == 'y':
		active_tc.append(Tests_dir+"/"+key)

# Getting test cases to run
test_run = (" ".join(str(tc) for tc in active_tc))

# Triggering Robot Framework to run test cases
os.system("robot -d "+ Reports_dir + " "+ "--name TestCases" + " "+ test_run)
os.system("open " + os.path.join(Reports_dir, "report.html"))