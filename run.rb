#!/usr/bin/env ruby
require_relative 'journal_archiver'

archiver = Archiver.new Journal.jep
archiver.generate

