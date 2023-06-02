const fs = require('fs');
const readline = require('readline');
const path = require('path')
const iconv = require('iconv-lite-umd');
const { exit } = require('process');

// get file path
const _args = process.argv.slice(2);
const path_raw = _args[0] || 'test.txt'
const path_ori = _args.length > 1 ? _args[1] : `file/origin/${path.basename(source_path)}`

const inputStream = fs.createReadStream(`${__dirname}/${path_raw}`, 'binary');
const lineReader = readline.createInterface({ input: inputStream });

lineReader.on('line', function(line) {
    fs.appendFileSync(
        `${__dirname}/${path_ori}`,
        iconv.decode(Buffer.from(line, 'binary'), 'BIG5HKSCS')+'\n'
    )
});

lineReader.on('close', function(){
    fs.unlinkSync(`${__dirname}/${path_raw}`)
    console.log(`done: ${path_ori}`)
});