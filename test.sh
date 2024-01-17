#!/bin/bash


function string_include_item() {
  local string="$1"
  local item="$2"
  if [[ $string == *"deb"* ]] ; then
    # yes, list include item
    echo "find it"
    result=0
  else
    result=1
  fi
  return $result
}


if  string_include_item ${1}; then
		    echo "find *.deb"
		fi
