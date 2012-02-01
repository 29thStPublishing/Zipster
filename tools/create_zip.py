import sys
import os

import zipfile


FOLDER = 'lady_rappers'

NEW_FOLDER = 'new_lady_rappers'


files = os.listdir(FOLDER)
zipfile = zipfile.ZipFile(('%s.zip' % NEW_FOLDER), mode='w')

for file in files:
    full_path_to_file = ("%s/%s" % (FOLDER, file))
    new_file = ("%s/%s" % (NEW_FOLDER, file))
    sys.stderr.write("file = %s\n" % full_path_to_file)
    try:
        zipfile.write(full_path_to_file, new_file)
    except:
        sys.stderr.write("Error with this file.\n")

zipfile.close()

sys.stderr.write("** SCRIPT COMPLETE. **\n")