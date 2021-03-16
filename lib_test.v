module main

fn test_translate() {
	assert translate([
		'#!/bin/bash',
		'',
		'mv test1 test2',
		'chmod 777 test2/file',
	]) == [
		'#!/usr/bin/env -S v run',
		'',
		"system('mv test1 test2')",
		"chmod('test2/file', 777)",
	]
}
