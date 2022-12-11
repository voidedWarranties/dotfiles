#!/usr/bin/env bash

nix build --impure .#homeConfigurations.ksk.activationPackage
