#!/usr/bin/env ruby
require_relative 'journal_archiver'

## generate JEP articles
Archiver.new(Journal.jep).generate

## generate AER articles
# Archiver.new(Journal.aer).generate

## Similarly for AEJ: AP and AEJ: M journals. I already defined these 4 for your convenience, See lib/journal.rb

## You can also define it yourself with:
# journal  = Journal.new "Journal Name", "http://journal_url"
# archiver = Archiver.new(journal, "some output folder name"
# archiver.generate

# Try not to run only one journal at a time and understand it first
