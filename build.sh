#!/bin/bash

nix build .?submodules=1#homeConfigurations.ksk.activationPackage
