module main

import os

fn main() {
	sh_filename := os.args[1]
	vsh_filename := sh_filename.replace('.sh', '').replace('.shell', '').replace('.bash', '') +
		'.vsh'

	sh := os.read_lines(sh_filename) ?
	vsh := translate(sh)

	mut file := os.open_file(vsh_filename, 'w+') ?
	file.writeln(vsh.join('\n')) ?
	file.close()
}
