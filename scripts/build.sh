#!/bin/bash

nix build --impure .#homeConfigurations.ksk.activationPackage
