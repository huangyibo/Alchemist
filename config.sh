#!/bin/bash

# Configuration file for building Alchemist

if [ "$SYSTEM" = "" ]; then
  export SYSTEM="MacOS"
fi

if [ "$SYSTEM" = "MacOS" ]; then
	export ALCHEMIST_PATH=$HOME/Projects/Alchemist2
	export ELEMENTAL_PATH=$HOME/Software/Elemental

elif [ "$SYSTEM" = "Linux" ]; then
	export ALCHEMIST_PATH=/usr/local/Alchemist
	export ELEMENTAL_PATH=/usr/local/elemental
	export ASIO_PATH=/usr/local/asio

elif [ "$SYSTEM" = "Cori" ]; then
	export ALCHEMIST_PATH=$SCRATCH/Projects/Alchemist2
	export ELEMENTAL_PATH=$SCRATCH/Software/Elemental
	export SPDLOG_PATH=$SCRATCH/Software/SPDLog	
	export EIGEN3_PATH=$HOME/Software/Eigen3
	export ARPACK_PATH=$HOME/Software/ARPACK
	
elif [ "$SYSTEM" = "<your system here>" ]; then
	export ALCHEMIST_PATH=$SCRATCH/Projects/Alchemist
	export ELEMENTAL_PATH=$SCRATCH/Software/Elemental
	export SPDLOG_PATH=$SCRATCH/Software/SPDLog	
	export EIGEN3_PATH=$HOME/Software/Eigen3
	export ARPACK_PATH=$HOME/Software/ARPACK

fi

echo $ALCHEMIST_PATH
