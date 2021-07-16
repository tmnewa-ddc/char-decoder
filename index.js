const fs = require('fs');
const readline = require('readline');
const path = require('path')
const iconv = require('iconv-lite-umd');
const { exit } = require('process');

// get file path
const _args = process.argv.slice(2);
const source_path = _args[0] || 'test.txt'
const file = path.basename(source_path)
const backup_path = `file/backup/${file}`
const target_path = `file/target/${file}`

const inputStream = fs.createReadStream(`${__dirname}/${source_path}`, 'binary');
const lineReader = readline.createInterface({ input: inputStream });

lineReader.on('line', function(line) {
    fs.appendFileSync(
        `${__dirname}/${target_path}`,
        iconv.decode(Buffer.from(line, 'binary'), 'BIG5HKSCS')+'\n'
    )
});

lineReader.on('close', function(){
    fs.renameSync(source_path, backup_path)
    console.log(`done: ${target_path}`)
});