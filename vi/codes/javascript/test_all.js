import { bold, brightRed } from 'jsr:@std/fmt/colors';
import { expandGlob } from 'jsr:@std/fs';
import { relative, resolve } from 'jsr:@std/path';

/**
 * @typedef {import('jsr:@std/fs').WalkEntry} WalkEntry
 * @type {WalkEntry[]}
 */
const entries = [];

for await (const entry of expandGlob(
    resolve(import.meta.dirname, './chapter_*/*.js')
)) {
    entries.push(entry);
}

/** @type {{ status: Promise<Deno.CommandStatus>; stderr: ReadableStream<Uint8Array>; }[]} */
const processes = [];

for (const file of entries) {
    const execute = new Deno.Command('node', {
        args: [relative(import.meta.dirname, file.path)],
        cwd: import.meta.dirname,
        stdin: 'piped',
        stdout: 'piped',
        stderr: 'piped',
    });

    const process = execute.spawn();
    processes.push({ status: process.status, stderr: process.stderr });
}

const results = await Promise.all(
    processes.map(async (item) => {
        const status = await item.status;
        return { status, stderr: item.stderr };
    })
);

/** @type {ReadableStream<Uint8Array>[]} */
const errors = [];

for (const result of results) {
    if (!result.status.success) {
        errors.push(result.stderr);
    }
}

console.log(`Tested ${entries.length} files`);
console.log(`Found exception in ${errors.length} files`);

if (errors.length) {
    console.log();

    for (const error of errors) {
        const reader = error.getReader();
        const { value } = await reader.read();
        const decoder = new TextDecoder();
        console.log(`${bold(brightRed('error'))}: ${decoder.decode(value)}`);
    }

    throw new Error('Test failed');
}
