#!/bin/bash

echo -n "Enter a number: "
read myvar
if [ $myvar -eq  1  ];
then
    echo "something"
else
    echo "something else"
fi

