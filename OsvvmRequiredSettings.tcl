#  File Name:         OsvvmRequiredSettings.tcl
#  Purpose:           Scripts for running simulations
#  Revision:          OSVVM MODELS STANDARD VERSION
# 
#  Maintainer:        Jim Lewis      email:  jim@synthworks.com 
#  Contributor(s):            
#     Jim Lewis      email:  jim@synthworks.com   
# 
#  Description
#    Required initializations for variables. 
#    DO NOT CHANGE THESE.
#    For things users can change, see OsvvmDefaultSettings.tcl
#    
#  Developed by: 
#        SynthWorks Design Inc. 
#        VHDL Training Classes
#        OSVVM Methodology and Model Library
#        11898 SW 128th Ave.  Tigard, Or  97223
#        http://www.SynthWorks.com
# 
#  Revision History:
#    Date      Version    Description
#     5/2022   2022.05    Refactored Variable handling
#
#
#  This file is part of OSVVM.
#  
#  Copyright (c) 2022 by SynthWorks Design Inc.  
#  
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#  
#      https://www.apache.org/licenses/LICENSE-2.0
#  
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#


#
# DO NOT CHANGE THESE SETTINGS
#   These settings are required by OSVVM to function properly
#   For things users can change, see OsvvmDefaultSettings.tcl
#

namespace eval ::osvvm {
  # Using OSVVM functions to set values allows the values
  # to be processed by the scripts (to make corrections, case changes, or normalize the path)  
  # 
  # ?Make it conditional?  Need to define VhdlLibraryInit - could even be only here
  #  if {![info exists VhdlLibraryInit]} {}
  SetLibraryDirectory $VhdlLibraryParentDirectory 
  #  variable VhdlLibraryInit "TRUE"
  
  SetVHDLVersion $DefaultVHDLVersion
  
  SetSimulatorResolution $SimulateTimeUnits
  
  SetTranscriptType $TranscriptExtension

  # CurrentWorkingDirectory is a relative path to the scripts currently running 
  set CurrentWorkingDirectory ""
  # CurrentSimulationDirectory is an absolute path to the simulation directory (for reports and such)
  set CurrentSimulationDirectory ""

  # Directory and Results file management
  variable ReportsDirectory          [file join ${OutputBaseDirectory} ${ReportsSubdirectory}]
  variable ResultsDirectory          [file join ${OutputBaseDirectory} ${ResultsSubdirectory}]
  variable CoverageDirectory         [file join ${OutputBaseDirectory} ${CoverageSubdirectory}]
  
  # VhdlReportsDirectory:  OSVVM temporary location for yml.  Moved to ${ReportsDirectory}/${TestSuiteName}
  variable VhdlReportsDirectory     "" ;  
  
  # OsvvmYamlResultsFile: temporary OSVVM name moved to ${OutputBaseDirectory}/${BuildName}.yaml
  variable OsvvmYamlResultsFile     "OsvvmRun.yml" ;  
  
  #  TranscriptYamlFile: temporary file that contains set of files used in TranscriptOpen.  Deleted by scripts.
  variable TranscriptYamlFile       "OSVVM_transcript.yml" ;  
  
#  #  OsvvmResultsDirectory: Used by VC test cases - update VC test cases
#  variable OsvvmResultsDirectory    "results"  ;  # 
}
