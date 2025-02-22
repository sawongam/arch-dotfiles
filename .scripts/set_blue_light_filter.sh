#!/bin/bash

wl-gammarelay &

sleep 1

busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 4000