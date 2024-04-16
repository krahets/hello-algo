import { expandGlob, type WalkEntry } from 'jsr:@std/fs';
import { relative } from 'jsr:@std/path';

const entries = [] as WalkEntry[];

for await (const entry of expandGlob('codes/typescript/chapter_*/*.ts')) {
    entries.push(entry);
}

const errors = [] as ReadableStream<Uint8Array>[];

for (const file of entries) {
    const command = new Deno.Command('tsx', {
        args: [relative(import.meta.dirname!, file.path)],
        cwd: import.meta.dirname,
        stdin: 'piped',
        stdout: 'piped',
        stderr: 'piped',
    });

    const process = command.spawn();
    const { success } = await process.status;
    if (!success) errors.push(process.stderr);
}

console.log(`Tested ${entries.length} files`);
console.log(`Found exception in ${errors.length} files`);

if (errors.length) {
    console.log();

    for (const error of errors) {
        const reader = error.getReader();
        const { value } = await reader.read();
        const decoder = new TextDecoder();
        console.error(decoder.decode(value));
    }

    throw new Error('Test failed');
}
