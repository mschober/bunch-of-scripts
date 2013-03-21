#!/bin/bash

comm <(sort $1) <(sort $2) | tee result.compared
