#!/usr/bin/env python
#
# "Scroll Packer" is dedicated to optimize scrolls.
# With this script, you can easily use fonts from many font sets in one scroll.
# It creates one output font set containing only these characters that are really used in scroll text.
# It is possible to work with fonts with a width and height from 1 to 8.
# The script can be incorporated with existing workflow of compilation of a demo.
#
# by tr1x / Agenda
# version: 0.1
# date: 2020-05-16

import json
import sys
import ntpath
import io
import datetime
import time

sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding = 'utf-8')
sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding = 'utf-8')

debug = False
version = "0.1"

def eprint(msg, filename = ''):
    if len(filename) != 0:
        print('"' + filename + '": ', end = '', file = sys.stderr)
    print(msg, file = sys.stderr)
    sys.stderr.flush()
    exit(1)


def load_json(filename):
    json_file = None
    try:
        json_file = open(filename, encoding = 'utf-8', mode = 'r')
        scroll_data = json.load(json_file)
    except FileNotFoundError:
        eprint('JSON file not found!', sys.argv[1])
    except json.JSONDecodeError as err:
        eprint('Error while parsing JSON file at line ' + str(err.lineno) +
               ' because "' + str(err.msg) + '"!', sys.argv[1])
    except:
        eprint('Error while opening or loading JSON file!', sys.argv[1])
    finally:
        if json_file != None:
            json_file.close()

    return scroll_data


def parse_scroll_text(scroll_data):
    if not 'scroll' in scroll_data:
        eprint('No "scroll" name detected!', sys.argv[1])

    if type(scroll_data['scroll']) != list:
        eprint('"scroll" is not a list!', sys.argv[1])

    index = 0
    for p in scroll_data['scroll']:
        if type(p) != str:
            eprint('Entry at index #' + str(index) + ' in "scroll" is not a string!', sys.argv[1])
        index += 1

    input_scroll_text = ''
    for p in scroll_data['scroll']:
        input_scroll_text += str(p)

    if len(str(input_scroll_text)) == 0:
        eprint('Empty text of scroll!', sys.argv[1])

    if debug == True:
        print('* Input scroll text: "' + input_scroll_text + '"')
        print('* Input scroll text length: ' + str(len(input_scroll_text)))
        sys.stdout.flush()

    return input_scroll_text


def parse_parameters(scroll_data):
    if not 'parameters' in scroll_data:
        eprint('No "parameters" name detected!', sys.argv[1])

    if type(scroll_data['parameters']) != dict:
        eprint('"parameters" is not an object!', sys.argv[1])

    if not 'width' in scroll_data['parameters']:
        eprint('No "width" name detected in "parameters"!', sys.argv[1])

    if type(scroll_data['parameters']['width']) != int:
        eprint('Value of "width" in "parameters" is not an integer"!', sys.argv[1])

    if scroll_data['parameters']['width'] < 1 or scroll_data['parameters']['width'] > 8:
        eprint('Value of "width" in "parameters" has to be between 1 and 8!', sys.argv[1])

    if not 'height' in scroll_data['parameters']:
        eprint('No "height" name detected in "parameters"!', sys.argv[1])

    if type(scroll_data['parameters']['height']) != int:
        eprint('Value of "height" in "parameters" is not an integer"!', sys.argv[1])

    if scroll_data['parameters']['height'] < 1 or scroll_data['parameters']['height'] > 8:
        eprint('Value of "height" in "parameters" has to be between 1 and 8!', sys.argv[1])

    if not 'begin' in scroll_data['parameters']:
        eprint('No "begin" name detected in "parameters"!', sys.argv[1])

    if type(scroll_data['parameters']['begin']) != int:
        eprint('Value of "begin" in "parameters" is not an integer!', sys.argv[1])

    if scroll_data['parameters']['begin'] < 0 or scroll_data['parameters']['begin'] > 255:
        eprint('Value of "begin" in "parameters" has to be between 0 and 255!', sys.argv[1])

    if 'zero' in scroll_data['parameters']:
        if type(scroll_data['parameters']['zero']) != bool:
            eprint('Value of "zero" in "parameters" is not a boolean!', sys.argv[1])

    if not 'language' in scroll_data['parameters']:
        eprint('No "language" name detected in "parameters"!', sys.argv[1])

    if type(scroll_data['parameters']['language']) != str:
        eprint('Value of "language" in "parameters" is not a string"!', sys.argv[1])

    if scroll_data['parameters']['language'] != 'C' and scroll_data['parameters']['language'] != 'Assembler':
        eprint('Value of "language" in "parameters" should be "C" or "Assembler"!', sys.argv[1])

    if not 'format' in scroll_data['parameters']:
        eprint('No "format" name detected in "parameters"!', sys.argv[1])

    if type(scroll_data['parameters']['format']) != str:
        eprint('Value of "format" in "parameters" is not a string!', sys.argv[1])

    if scroll_data['parameters']['format'] != 'dec' and scroll_data['parameters']['format'] != 'hex':
        eprint('Value of "format" in "parameters" should be "dec" or "hex"!', sys.argv[1])

    if scroll_data['parameters']['height'] > 1:
        if not 'consolidation' in scroll_data['parameters']:
            eprint('No "consolidation" name detected in "parameters!', sys.argv[1])

        if type(scroll_data['parameters']['consolidation']) != bool:
            eprint('Value of "consolidation" in "parameters" is not a boolean!', sys.argv[1])

    if 'text_org' in scroll_data['parameters']:
        if type(scroll_data['parameters']['text_org']) != str:
            eprint('Value of "text_org" in "parameters" is not a string!', sys.argv[1])

    if 'fonts_org' in scroll_data['parameters']:
        if type(scroll_data['parameters']['fonts_org']) != list:
            eprint('"fonts_org" in "parameters" is not a list!', sys.argv[1])

        for p in scroll_data['parameters']['fonts_org']:
            if type(p) != str:
                eprint('One of values of "fonts_org" in "parameters" is not a string!', sys.argv[1])


def parse_fonts(scroll_data):
    if not 'fonts' in scroll_data:
        eprint('No "fonts" name detected!', sys.argv[1])

    if type(scroll_data['fonts']) != list:
        eprint('"fonts" is not a list!', sys.argv[1])

    if len(scroll_data['fonts']) == 0:
        eprint('No definition(s) of fonts detected!', sys.argv[1])

    index = 0
    for p in scroll_data['fonts']:
        if type(p) != dict:
            eprint('Entry at index #' + str(index) + ' in "fonts" is not an object!', sys.argv[1])

        if not 'set' in p:
            eprint('No "set" name detected in "fonts" at index #' + str(index) + '!', sys.argv[1])

        if type(p['set']) != str:
            eprint('Value of "set" in "fonts" at index #' + str(index) + ' is not a string!', sys.argv[1])

        if len(p['set']) == 0:
            eprint('Empty "set" in "fonts" at index #' + str(index) + '!', sys.argv[1])

        if 'set_default' in p:
            if type(p['set_default']) != str:
                eprint('Value of "set_default" in "fonts" at index #' + str(index) + ' is not a string!', sys.argv[1])

            if len(p['set_default']) > 0 and p['set'] == p['set_default']:
                eprint('Values of "set" and "set_default" are the same!', sys.argv[1])

        if 'set_or' in p:
            if type(p['set_or']) != str:
                eprint('Value of "set_or" in "fonts" at index #' + str(index) + ' is not a string!', sys.argv[1])

            if len(p['set_or']) > 0 and p['set'] == p['set_or']:
                eprint('Values of "set" and "set_or" are the same!', sys.argv[1])

            if 'set_default' in p and len(p['set_default']) > 0 and len(p['set_or']) > 0 and\
                    p['set_or'] == p['set_default']:
                eprint('Values of "set_default" and "set_or" are the same!', sys.argv[1])

        if not 'file' in p:
            eprint('No "file" name detected in "fonts" at index #' + str(index) + '!', sys.argv[1])

        if type(p['file']) != str:
            eprint('Value of "file" in "fonts" at index #' + str(index) + ' is not a string!', sys.argv[1])

        if len(p['file']) == 0:
            eprint('Empty "file" in "fonts" at index #' + str(index) + '!', sys.argv[1])

        if not 'lookup' in p:
            eprint('No "lookup" name detected in "fonts" at index #' + str(index) + '!', sys.argv[1])

        if type(p['lookup']) != str:
            eprint('Value of "lookup" in "fonts" at index #' + str(index) + ' is not a string!', sys.argv[1])

        if len(str(p['lookup'])) == 0:
            eprint('Empty "lookup" in "fonts" at index #' + str(index) + '!', sys.argv[1])

        index += 1

    for p in scroll_data['fonts']:
        for r in scroll_data['fonts']:
            if p['set'] == r['set'] and not p is r:
                eprint('Set "' + p['set'] + '" is duplicated in "fonts"!', sys.argv[1])


def parse_lookups(scroll_data):
    if not 'lookups' in scroll_data:
        eprint('No "lookups" name detected!', sys.argv[1])

    if type(scroll_data['lookups']) != list:
        eprint('"lookups" is not a list!', sys.argv[1])

    index = 0
    for p in scroll_data['lookups']:
        if type(p) != dict:
            eprint('Entry at index #' + str(index) + ' in "lookups" is not an object!', sys.argv[1])

        if not 'lookup' in p:
            eprint('No "lookup" name detected in "lookups" at index #' + str(index) + '!', sys.argv[1])

        if type(p['lookup']) != str:
            eprint('Value of "lookup" in "lookups" at index #' + str(index) + ' is not a string!', sys.argv[1])

        if len(str(p['lookup'])) == 0:
            eprint('Empty "lookup" in "lookups" at index #' + str(index) + '!', sys.argv[1])

        if not 'mapping' in p:
            eprint('No "mapping" name detected in "lookups" in lookup "' + p['lookup'] + '"!', sys.argv[1])

        if type(p['mapping']) != list:
            eprint('"mapping" in "lookups" in lookup "' + p['lookup'] + '" is not a list!', sys.argv[1])

        if len(p['mapping']) == 0:
            eprint('No definition(s) of "mapping" detected in "lookups" in lookup "' + p['lookup'] + '"!', sys.argv[1])

        index2 = 0
        for r in p['mapping']:
            if type(r) != dict:
                eprint('Entry at index #' + str(index2) + ' in "mapping" of "lookups" in lookup "' +
                       p['lookup'] + '" is not an object!', sys.argv[1])

            if not 'tag' in r:
                eprint('No "tag" name detected in "mapping" of "lookups" in lookup "' + p['lookup'] +
                       '" at index #' + str(index2) + '!', sys.argv[1])

            if type(r['tag']) != str:
                eprint('Value of "tag" in "mapping" of "lookups" in lookup "' + p['lookup'] +
                       '" at index #' + str(index2) + ' is not a string!', sys.argv[1])

            if not 'offsets' in r:
                eprint('No "offsets" name detected for tag "' + r['tag'] + '" ' +
                       'in "mapping" of "lookups" in lookup "' + p['lookup'] +
                       '" at index #' + str(index2) + '!', sys.argv[1])

            if type(r['offsets']) != list:
                eprint('"offsets" for tag "' + r['tag'] + '" in "mapping" of "lookups" in lookup "' + p['lookup'] +
                       '" at index #' + str(index2) + ' is not a list!', sys.argv[1])

            if len(r['offsets']) != scroll_data['parameters']['width'] * scroll_data['parameters']['height']:
                eprint('Wrong number of elements of "offsets" for tag "' + r['tag'] + '" in "mapping" of "lookups" ' +
                       'in "lookup "' + p['lookup'] + '" at index #' + str(index2) + '!', sys.argv[1])

            for w in r['offsets']:
                if type(w) != int:
                    eprint('One of values of "offsets" for tag "' + r['tag'] + '" in "mapping" of "lookups" in ' +
                           'lookup "' + p['lookup'] + '" at index #' + str(index2) + ' is not an integer!', sys.argv[1])

                if w < 0:
                    eprint('One of values of "offsets" for tag "' + r['tag'] +
                           '" in "mapping" of "lookups" in lookup "' +
                           p['lookup'] + '" at index #' + str(index2) + ' is less than zero!', sys.argv[1])

            if 'or' in r:
                if type(r['or']) != int:
                    eprint('Value of "or" for tag "' + r['tag'] + '" in "mapping" of "lookups" in lookup "' +
                           p['lookup'] + '" at index #' + str(index2) + ' is not an integer!', sys.argv[1])

                if r['or'] < 0 or r['or'] > 255:
                    eprint('Value of "or" for tag "' + r['tag'] + '" in "mapping" of "lookups" in lookup "' +
                           p['lookup'] + '" at index #' + str(index2) + ' has to be between 0 and 255!', sys.argv[1])

            index2 += 1
        index += 1

    for p in scroll_data['lookups']:
        for r in scroll_data['lookups']:
                if p['lookup'] == r['lookup'] and not p is r:
                    eprint('Lookup "' + p['lookup'] + '" is duplicated in "lookups"!', sys.argv[1])

    for p in scroll_data['fonts']:
        for r in scroll_data['lookups']:
            for s in r['mapping']:
                if s['tag'] == p['set']:
                    eprint('Set "' + p['set'] + '" in "fonts" has the same name as tag of "lookups" in ' +
                           'lookup "' + r['lookup'] + '"!', sys.argv[1])

    for p in scroll_data['fonts']:
        if 'set_default' in p:
            for r in scroll_data['lookups']:
                for s in r['mapping']:
                    if s['tag'] == p['set_default']:
                        eprint('"Default" set "' + p['set_default'] + '" in "fonts" has the same name as tag ' +
                               'of "lookups" in lookup "' + r['lookup'] + '"!', sys.argv[1])
        if 'set_or' in p:
            for r in scroll_data['lookups']:
                for s in r['mapping']:
                    if s['tag'] == p['set_or']:
                        eprint('"Or" set "' + p['set_or'] + '" in "fonts" has the same name as tag of "lookups" in ' +
                               'lookup "' + r['lookup'] + '"!', sys.argv[1])

    for p in scroll_data['lookups']:
        for r in p['mapping']:
            for s in p['mapping']:
                if r['tag'] == s['tag'] and not r is s and len(r['tag']) > 0:
                    eprint('Tag "' + r['tag'] + '" is duplicated in "mapping" of "lookups" in lookup "' + p['lookup'] +
                           '!', sys.argv[1])

    for p in scroll_data['fonts']:
        for r in scroll_data['lookups']:
            if p['lookup'] == r['lookup']:
                break
        else:
            eprint('Lookup "' + p['lookup'] + '" in "fonts" refers to nonexistent entry of "lookups"!', sys.argv[1])


def find_sets_or_tags_in_scroll_text(scroll_data, input_scroll_text):
    active_set = scroll_data['fonts'][0]
    isActiveSetWithOr = False
    default_set = scroll_data['fonts'][0]
    start_position = 0
    used_tags = []
    output_scroll_data = []

    if debug == True:
        print('* Default font set: ' + default_set['set'])
        print('* Active font set: ' + active_set['set'])
        sys.stdout.flush()

    while start_position < len(input_scroll_text):
        found_tag = {}

        # 1st step: try to find font sets to be marked as active
        index = 0
        for p in scroll_data['fonts']:
            position = input_scroll_text.find(p['set'], start_position)
            if (position != -1 and len(found_tag) == 0) or\
                    (position != -1 and len(found_tag) != 0 and position < found_tag['position']):
                found_tag = {'position': position, 'length': len(p['set']), 'set': p['set'], 'origin': 'fonts',
                             'index': index, 'file': p['file']}
            index += 1

        # 2nd step: try to find font sets to be marked as active with "or"
        index = 0
        for p in scroll_data['fonts']:
            if 'set_or' in p and len(str(p['set_or'])) > 0:
                position = input_scroll_text.find(p['set_or'], start_position)
                if (position != -1 and len(found_tag) == 0) or\
                        (position != -1 and len(found_tag) != 0 and position < found_tag['position']):
                    found_tag = {'position': position, 'length': len(p['set_or']), 'set': p['set'],
                                 'origin': 'fonts_or', 'index': index, 'file': p['file']}
            index += 1

        # 3rd step: try to find font sets to be marked as default
        index = 0
        for p in scroll_data['fonts']:
            if 'set_default' in p and len(str(p['set_default'])) > 0:
                position = input_scroll_text.find(p['set_default'], start_position)
                if (position != -1 and len(found_tag) == 0) or\
                        (position != -1 and len(found_tag) != 0 and position < found_tag['position']):
                    found_tag = {'position': position, 'length': len(p['set_default']), 'set': p['set'],
                                 'origin': 'fonts_default', 'index': index, 'file': p['file']}
            index += 1

        # 4th: try to find tags in currently active font set
        for p in scroll_data['lookups']:
            if p['lookup'] == active_set['lookup']:
                for r in p['mapping']:
                    if len(str(r['tag'])) != 0:
                        position = input_scroll_text.find(r['tag'], start_position)
                        if (position != -1 and len(found_tag) == 0) or\
                                (position != -1 and len(found_tag) != 0 and position < found_tag['position']):
                            found_tag = {'position': position, 'length': len(r['tag']), 'tag': r['tag'],
                                         'offsets': r['offsets'], 'origin': 'lookups',
                                         'set': active_set['set'], 'file': active_set['file']}
                            if isActiveSetWithOr == True and 'or' in r:
                                found_tag['or'] = r['or']
                break

        # 5th: try to find tags in default font set
        for p in scroll_data['lookups']:
            if p['lookup'] == default_set['lookup']:
                for r in p['mapping']:
                    if len(str(r['tag'])) != 0:
                        position = input_scroll_text.find(r['tag'], start_position)
                        if (position != -1 and len(found_tag) == 0) or\
                                (position != -1 and len(found_tag) != 0 and position < found_tag['position']):
                            found_tag = {'position': position, 'length': len(r['tag']), 'tag': r['tag'],
                                         'offsets': r['offsets'], 'origin': 'lookups',
                                         'set': default_set['set'], 'file': default_set['file']}
                break

        # 6th: try to find tags in any font sets
        for p in scroll_data['lookups']:
            if p['lookup'] != active_set['lookup'] and p['lookup'] != default_set['lookup']:
                for r in p['mapping']:
                    if len(str(r['tag'])) != 0:
                        position = input_scroll_text.find(r['tag'], start_position)
                        if (position != -1 and len(found_tag) == 0) or\
                                (position != -1 and len(found_tag) != 0 and position < found_tag['position']):
                            for s in scroll_data['fonts']:
                                if s['lookup'] == p['lookup']:
                                    break
                            found_tag = {'position': position, 'length': len(r['tag']), 'tag': r['tag'],
                                         'offsets': r['offsets'], 'origin': 'lookups',
                                         'set': s['set'], 'file': s['file']}

        if (len(found_tag) == 0 or found_tag['position'] != start_position):
            min = start_position - 5 if start_position - 5 >= 0 else 0
            max = start_position + 6 if start_position + 5 <= len(input_scroll_text) else len(input_scroll_text)

            eprint('Character "' + input_scroll_text[start_position] + '" «' + input_scroll_text[min:max] +
                   '» at position ' + str(start_position) +
                   ' in scroll text is not defined in any "tag" of "lookups" nor any "set" of "fonts"!', sys.argv[1])

        if found_tag['origin'] == 'fonts':
            if debug == True:
                print('* Active font set changed to: ' + found_tag['set'])
                sys.stdout.flush()
            active_set = scroll_data['fonts'][found_tag['index']]
            isActiveSetWithOr = False
            start_position += found_tag['length']
        elif found_tag['origin'] == 'fonts_or':
            if debug == True:
                print('* Active font set changed to: ' + found_tag['set'] + ' with "or"')
                sys.stdout.flush()
            active_set = scroll_data['fonts'][found_tag['index']]
            isActiveSetWithOr = True
            start_position += found_tag['length']
        elif found_tag['origin'] == 'fonts_default':
            if debug == True:
                print('* Default font set changed to: ' + found_tag['set'])
                sys.stdout.flush()
            default_set = scroll_data['fonts'][found_tag['index']]
            start_position += found_tag['length']
        else:
            r = {}
            for p in used_tags:
                if p['tag'] == found_tag['tag'] and p['set'] == found_tag['set']:
                    r = p
            if len(r) == 0:
                byte = len(used_tags)
                if 'or' in found_tag:
                    used_tags.append({'byte': byte, 'tag': found_tag['tag'], 'offsets': found_tag['offsets'],
                                      'set': found_tag['set'], 'file': found_tag['file'], 'or': found_tag['or']})
                else:
                    used_tags.append({'byte': byte, 'tag': found_tag['tag'], 'offsets': found_tag['offsets'],
                                      'set': found_tag['set'], 'file': found_tag['file']})
                if debug == True:
                    if 'or' in found_tag:
                        print('* New tag found: "' + found_tag['tag'] + '", set: ' + found_tag['set'] + ' with "or"')
                    else:
                        print('* New tag found: "' + found_tag['tag'] + '", set: ' + found_tag['set'])
                    sys.stdout.flush()
                if 'or' in found_tag:
                    output_scroll_data.append({'index': len(output_scroll_data), 'byte': byte, 'tag': found_tag['tag'],
                                               'offsets': found_tag['offsets'], 'set': found_tag['set'],
                                               'file': found_tag['file'], 'or': found_tag['or']})
                else:
                    output_scroll_data.append({'index': len(output_scroll_data), 'byte': byte, 'tag': found_tag['tag'],
                                               'offsets': found_tag['offsets'], 'set': found_tag['set'],
                                               'file': found_tag['file']})
            else:
                output_scroll_data.append(r.copy())
                if debug == True:
                    if 'or' in found_tag:
                        print('* Existing tag found: "' + p['tag'] + '", set: ' + p['set'] + ' with "or"')
                    else:
                        print('* Existing tag found: "' + p['tag'] + '", set: ' + p['set'])
                    sys.stdout.flush()
                if 'or' in found_tag:
                    output_scroll_data[len(output_scroll_data) - 1]['or'] = found_tag['or']
                else:
                    if 'or' in output_scroll_data[len(output_scroll_data) - 1]:
                        del output_scroll_data[len(output_scroll_data) - 1]['or']

            start_position += found_tag['length']

    if debug == True:
        print('* Number of unique characters: ' + str(len(used_tags)))
        sys.stdout.flush()

    if len(used_tags) + scroll_data['parameters']['begin'] > 256:
        eprint('Max. value of bytes in scroll text exeedes 256!', sys.argv[1])

    if 'zero' in scroll_data['parameters'] and scroll_data['parameters']['zero'] == True:
        output_scroll_data.append({'byte': -scroll_data['parameters']['begin'], 'tag': 'ZERO', 'offsets': 0, 'set': ''})

    return output_scroll_data, used_tags


def print_header():
    if (scroll_data['parameters']['language'] == 'C'):
        print('/* "Scroll Packer" v' + version + ', ' +
              datetime.datetime.fromtimestamp(time.time()).strftime('%Y-%m-%d %H:%M:%S') + ', "' +
              sys.argv[1] + '" */\n')
    elif (scroll_data['parameters']['language'] == 'Assembler'):
        print('; "Scroll Packer" v' + version + ', ' +
              datetime.datetime.fromtimestamp(time.time()).strftime('%Y-%m-%d %H:%M:%S') + ', "' +
              sys.argv[1] + '"\n')


def print_scroll_data(scroll_data, output_scroll_data, used_tags):
    if (scroll_data['parameters']['language'] == 'C'):
        print('/* scroll text, length: ' + str(len(output_scroll_data)) +
              ', unique characters: ' + str(len(used_tags)) + ' */')
        print('uint8_t text[] = {')
    elif (scroll_data['parameters']['language'] == 'Assembler'):
        if 'text_org' in scroll_data['parameters'] and len(str(scroll_data['parameters']['text_org'])) > 0:
            print(scroll_data['parameters']['text_org'])
        print('; scroll text, length: ' + str(len(output_scroll_data)) +
              ', unique characters: ' + str(len(used_tags)))
        print('text', end = '')

    comment = ''
    cntr = 0
    for p in output_scroll_data:
        if cntr % 8 == 0:
            if scroll_data['parameters']['language'] == 'C':
                print('\t', end = '')
            elif scroll_data['parameters']['language'] == 'Assembler':
                print('\t.byte ', end = '')

        comment += p['tag']
        if scroll_data['parameters']['format'] == 'hex':
            if scroll_data['parameters']['language'] == 'C':
                if cntr % 8 == 7 or cntr == len(output_scroll_data) - 1:
                    print('0x' + format((p['byte'] | (p['or'] if 'or' in p else 0)) +
                                        scroll_data['parameters']['begin'], '02x') + ',', end = '')
                else:
                    print('0x' + format((p['byte'] | (p['or'] if 'or' in p else 0)) +
                                        scroll_data['parameters']['begin'], '02x') + ', ', end = '')
            elif scroll_data['parameters']['language'] == 'Assembler':
                if (cntr % 8 < 7) and (cntr < len(output_scroll_data) - 1):
                    print('$' + format((p['byte'] | (p['or'] if 'or' in p else 0)) +
                                       scroll_data['parameters']['begin'], '02x') + ', ', end = '')
                else:
                    print('$' + format((p['byte'] | (p['or'] if 'or' in p else 0)) +
                                       scroll_data['parameters']['begin'], '02x'), end = '')
        elif scroll_data['parameters']['format'] == 'dec':
            if scroll_data['parameters']['language'] == 'C':
                if cntr % 8 == 7 or cntr == len(output_scroll_data) - 1:
                    print(str((p['byte'] | (p['or'] if 'or' in p else 0)) +
                              scroll_data['parameters']['begin']) + ',', end = '')
                else:
                    print(str((p['byte'] | (p['or'] if 'or' in p else 0)) +
                              scroll_data['parameters']['begin']) + ', ', end = '')
            elif scroll_data['parameters']['language'] == 'Assembler':
                if (cntr % 8 < 7) and (cntr < len(output_scroll_data) - 1):
                    print(str((p['byte'] | (p['or'] if 'or' in p else 0)) +
                              scroll_data['parameters']['begin']) + ', ', end = '')
                else:
                    print(str((p['byte'] | (p['or'] if 'or' in p else 0)) +
                              scroll_data['parameters']['begin']), end = '')

        if cntr % 8 == 7:
            print_scroll_text_as_comment(scroll_data, output_scroll_data, cntr, comment)
            comment = ''

        cntr += 1

    if len(comment) != 0:
        print_scroll_text_as_comment(scroll_data, output_scroll_data, cntr, comment)

    print()
    if scroll_data['parameters']['language'] == 'C':
        print('};')
    elif scroll_data['parameters']['language'] == 'Assembler':
        print('textend')
    print()


def print_scroll_text_as_comment(scroll_data, output_scroll_data, cntr, comment):
    if scroll_data['parameters']['language'] == 'C':
        print('\t/* ', end = '')
    elif scroll_data['parameters']['language'] == 'Assembler':
        print('\t; ', end = '')

    print(comment, end = '')
    if scroll_data['parameters']['language'] == 'C':
        if cntr < len(output_scroll_data) - 1:
            print(' */')
        else:
            print(' */', end = '')
    elif scroll_data['parameters']['language'] == 'Assembler':
        if cntr < len(output_scroll_data) - 1:
            print()
        else:
            print(end = '')


def print_fonts_data(scroll_data, used_tags):
    files_handlers = {}
    for p in scroll_data['fonts']:
        try:
            files_handlers[p['set']] = open(p['file'], 'rb')
        except FileNotFoundError:
            eprint('File "' + p['file'] + '" not found!')
        except:
            eprint('File "' + p['file'] + '" cannot be opened!')

    if scroll_data['parameters']['height'] == 1 or scroll_data['parameters']['consolidation'] == True:
        if scroll_data['parameters']['language'] == 'C':
            print('/* fonts data */')
            print('uint8_t fonts[] = {')
            for p in used_tags:
                for row in range(0, scroll_data['parameters']['height']):
                    print_fonts_data_one_row(scroll_data, files_handlers, p, row)
            print('};')

        elif scroll_data['parameters']['language'] == 'Assembler':
            if 'fonts_org' in scroll_data['parameters'] and len(scroll_data['parameters']['fonts_org']) > 0 and\
                len(str(scroll_data['parameters']['fonts_org'][0])) > 0:
                print(scroll_data['parameters']['fonts_org'][0])
            print('; fonts data')
            print('fonts', end = '')
            for p in used_tags:
                for row in range(0, scroll_data['parameters']['height']):
                    print_fonts_data_one_row(scroll_data, files_handlers, p, row)
            print('fontsen')

    else:
        if scroll_data['parameters']['language'] == 'C':
            print('/* fonts data */')
            print('uint8_t fonts[] = {')
            for row in range(0, scroll_data['parameters']['height']):
                if row > 0:
                    print()
                print('\t/* row no. ' + str(row) + ' */')
                for p in used_tags:
                    print_fonts_data_one_row(scroll_data, files_handlers, p, row)
            print('};')

        elif scroll_data['parameters']['language'] == 'Assembler':
            for row in range(0, scroll_data['parameters']['height']):
                if row > 0:
                    print()
                if 'fonts_org' in scroll_data['parameters'] and\
                    len(scroll_data['parameters']['fonts_org']) >= row + 1 and\
                    len(str(scroll_data['parameters']['fonts_org'][row])) > 0:
                        print(scroll_data['parameters']['fonts_org'][row])
                print('; fonts data, row no. ' + str(row))
                print('fonts' + str(row), end = '')
                for p in used_tags:
                    print_fonts_data_one_row(scroll_data, files_handlers, p, row)
                print('fonts' + str(row) + 'e')

    for p in files_handlers.values():
        try:
            p.close()
        except:
            eprint('File "' + p.name + '" cannot be closed!')


def print_fonts_data_one_row(scroll_data, files_handlers, p, row):
    if scroll_data['parameters']['language'] == 'C':
        print('\t', end = '')
        for i in range(0, scroll_data['parameters']['width'] * 8):
            files_handlers[p['set']].seek(p['offsets'][row * scroll_data['parameters']['width'] + i // 8] * 8 +
                                          (i % 8), 0)
            if i % 8 == 7:
                if scroll_data['parameters']['format'] == 'hex':
                    print('0x' + format(int.from_bytes(files_handlers[p['set']].read(1), byteorder = 'little'), '02x') +
                          ',', end = '')
                elif scroll_data['parameters']['format'] == 'dec':
                    print(str(int.from_bytes(files_handlers[p['set']].read(1), byteorder = 'little')) + ',', end = '')
                print('\t/* "' + p['tag'] + '" ' + p['set'] + ' ' + str(i // 8) + '_' + str(row) + ' */')
                if i < scroll_data['parameters']['width'] * 8 - 1:
                    print('\t', end = '')
            else:
                if scroll_data['parameters']['format'] == 'hex':
                    print('0x' + format(int.from_bytes(files_handlers[p['set']].read(1), byteorder = 'little'), '02x') +
                          ', ', end = '')
                elif scroll_data['parameters']['format'] == 'dec':
                    print(str(int.from_bytes(files_handlers[p['set']].read(1), byteorder = 'little')) + ', ', end = '')

    elif scroll_data['parameters']['language'] == 'Assembler':
        print('\t.byte ', end = '')
        for i in range(0, scroll_data['parameters']['width'] * 8):
            files_handlers[p['set']].seek(p['offsets'][row * scroll_data['parameters']['width'] + i // 8] * 8 +
                                          (i % 8), 0)
            if i % 8 == 7:
                if scroll_data['parameters']['format'] == 'hex':
                    print('$' + format(int.from_bytes(files_handlers[p['set']].read(1), byteorder = 'little'), '02x'),
                          end = '')
                elif scroll_data['parameters']['format'] == 'dec':
                    print(str(int.from_bytes(files_handlers[p['set']].read(1), byteorder = 'little')), end = '')
                print('\t; "' + p['tag'] + '" ' + p['set'] + ' ' + str(i // 8) + '_' + str(row))
                if i < scroll_data['parameters']['width'] * 8 - 1:
                    print('\t.byte ', end = '')
            else:
                if scroll_data['parameters']['format'] == 'hex':
                    print('$' + format(int.from_bytes(files_handlers[p['set']].read(1), byteorder = 'little'), '02x') +
                          ', ', end = '')
                elif scroll_data['parameters']['format'] == 'dec':
                    print(str(int.from_bytes(files_handlers[p['set']].read(1), byteorder = 'little')) + ', ', end = '')


if len(sys.argv) != 2:
    eprint('Usage: ' + ntpath.basename(sys.argv[0]) + ' filename.json')

scroll_data = load_json(sys.argv[1])
input_scroll_text = parse_scroll_text(scroll_data)
parse_parameters(scroll_data)
parse_fonts(scroll_data)
parse_lookups(scroll_data)
output_scroll_data, used_tags = find_sets_or_tags_in_scroll_text(scroll_data, input_scroll_text)
print_header()
print_scroll_data(scroll_data, output_scroll_data, used_tags)
print_fonts_data(scroll_data, used_tags)
sys.stdout.flush()