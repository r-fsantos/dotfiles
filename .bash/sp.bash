#!/bin/bash
# vi: filetype=sh
# -*- mode: sh -*-

function sp() {
  cd $(projector list | fzf)
}
