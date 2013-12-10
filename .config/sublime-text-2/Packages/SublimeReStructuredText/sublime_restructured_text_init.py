# disable default "RestructuredText" package

import sublime, json, os

#
# sublime bug?: erases all user settings on restart!
#
#settings = sublime.load_settings(u'Preferences.sublime-settings')
#ignored_packages = settings.get(u'ignored_packages', [])
#  if 'RestructuredText' not in ignored_packages:
#   ignored_packages.append(u'RestructuredText')
#   settings.set('ignored_packages', ignored_packages)
#   sublime.save_settings(u'Preferences.sublime-settings')

def end_module():
    pass

def begin_module():

    user_preferences_file = os.path.join(sublime.packages_path(), 
        'User', 'Preferences.sublime-settings')

    import sys, re

    sys.stderr.write("user_preferences_file: %s\n" % user_preferences_file)

    user_preferences = {}
    if os.path.exists(user_preferences_file):
        with open(user_preferences_file, 'r') as f:
            s = f.read()

        s = re.sub(r'(^|(?<=\n))\s*//.*', '', s)
        sys.stderr.write("s: %s\n" % s)
        user_preferences = json.loads(s)

    if 'ignored_packages' not in user_preferences:
        user_preferences['ignored_packages'] = [ 'Vintage' ]

    changed = False
    if 'RestructuredText' not in user_preferences['ignored_packages']:
        changed = True
        user_preferences['ignored_packages'].append('RestructuredText')

    if changed:
        with open(user_preferences_file, 'rb') as f:
            backup = '.0.bak'
            i = 0
            while os.path.exists(user_preferences_file+backup):
                i += 1
                backup = '.%s.bak' % i

            with open(user_preferences_file+backup, 'wb') as b:
                b.write(f.read())

        with open(user_preferences_file, 'w') as f:
            json.dump(user_preferences, f, indent=4)

# comments are removed on dumping json :(

ST3 = sublime.version() >= '3000'

if ST3:

    def plugin_unloaded():
        end_module()

    def plugin_loaded():
        begin_module()

else:
    def unload_handler():
        end_module()

    begin_module()

