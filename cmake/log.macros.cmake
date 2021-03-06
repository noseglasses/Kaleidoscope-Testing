# -*- mode: cmake -*-
# Leidokos-Testing -- Testing framework for the Kaleidoscope firmware
# Copyright (C) 2017 noseglasses (shinynoseglasses@github.com)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
function(log)

   set(options "FATAL_ERROR" "SEND_ERROR" "WARNING")
   set(one_value_args "")
   set(multi_value_args "")
   
   cmake_parse_arguments(args "${options}" "${one_value_args}" "${multi_value_args}" ${ARGN} )

   if(NOT "${log_file}" STREQUAL "")
   
      if(args_FATAL_ERROR OR args_SEND_ERROR)
         file(APPEND "${log_file}" "ERROR: ")
      endif()
      
      if(args_WARNING)
         file(APPEND "${log_file}" "WARNING: ")
      endif()
      
      file(APPEND "${log_file}" "${args_UNPARSED_ARGUMENTS}\n")
      
   endif()
   
   message(${ARGN})
   
endfunction()