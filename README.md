# Perl - Text to JSON Script

Quick Perl script that converts the format of text in `products_list.txt` to a JSON string, output in `parser_output.json`.

This script does not clear the output file when it has to be truncated manually before a run.

To run: `perl ./parser.pl`

## Dependencies

It requires the JSON Perl module in your computer to be installed. On a mac:

```
brew install cpanm;
sudo cpan install json;
```