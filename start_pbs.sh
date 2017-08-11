#!/bin/bash

#mainly to debug locally
if [ -z $WORKFLOW_DIR ]; then export WORKFLOW_DIR=`pwd`; fi
if [ -z $TASK_DIR ]; then export TASK_DIR=`pwd`; fi
if [ -z $SERVICE_DIR ]; then export SERVICE_DIR=`pwd`; fi

#clean up previous job (just in case)
rm -f finished
jobid=`qsub $SERVICE_DIR/submit.pbs`
echo $jobid > jobid

