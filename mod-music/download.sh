#!/bin/bash
for i in $(cat songs); do
    curl -O -J $i
done

