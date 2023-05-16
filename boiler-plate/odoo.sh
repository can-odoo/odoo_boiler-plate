#!/bin/bash
# make a directory

# testing
# new comment


mkdir module_name

# go to current directory
cd module_name

# making odoo standard structure
mkdir models
mkdir views
mkdir static
mkdir security

# __init__ file
touch __init__.py
echo "# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.

from . import models

" > __init__.py

# __manifest__ file
touch __manifest__.py
echo "# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.
{
    'name': 'Base',
    'version': '1.3',
    'category': 'Hidden',
    'description': '''
    	Describe me...
    ''',
    'depends': [],
    'data': [],
    'assets': {
    },
    'application': True,
    'auto_install': False,
    'license': 'LGPL-3',
}
" > __manifest__.py

# 
cd models
touch __init__.py
echo "# -*- coding: utf-8 -*-

from . import model_name
" > __init__.py

touch model_name.py
echo "# -*- coding: utf-8 -*-
from odoo import fields, models


class ModelName(models.Model):
    _name = 'model.name'
    _description = 'describe me'
" > model_name.py
