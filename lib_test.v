module main

fn test_translate() {
	assert translate([
		'#!/bin/bash',
		'',
		'mv test1 test2',
	]) == [
		'#!/usr/bin/env -S v run',
		'',
		"system('mv test1 test2')",
	]
}
