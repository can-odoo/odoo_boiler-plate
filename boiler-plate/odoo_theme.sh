#!/bin/bash
# make a directory

mkdir my_theme

# go to current directory
cd my_theme

# making odoo standard structure
mkdir views
mkdir static

# __init__ file
touch __init__.py
echo "# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.

" > __init__.py

# __manifest__ file
touch __manifest__.py
echo "# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.
{
    'name': 'My theme',
    'version': '16.0.0.1',
    'category': 'Hidden',
    'description': '''
    	Odoo website E-comm theme
    ''',
    'depends': ['website',],
    # add dependency if required
    # 'website_mail_group', 'website_sale', 'website_sale_wishlist',
    'data': [

        # data
        'data/options.xml',
        # 'data/images.xml',

        # pages
        'data/pages/homepage.xml',

        # views
        'views/header.xml',
        'views/footer.xml',

        # snippets
        'views/snippets/options.xml',
        'views/snippets/s_shopper_rating.xml',
    ],
    'assets': {
    	# override primary variable's like fonts, color etc
        'web._assets_primary_variables': [
            'my_theme/static/src/scss/primary_variables.scss',
        ],
        'web.assets_frontend': [

        # layout
            # 'my_theme/static/src/scss/layout/header.scss',
            # 'my_theme/static/src/scss/layout/footer.scss',
        ],
    },
    'application': True,
    'auto_install': False,
    'license': 'LGPL-3',
}
" > __manifest__.py

# 
cd views
touch footer.xml
echo '<?xml version="1.0" encoding="UTF-8"?>

<!-- replace all `` to single string -->

<odoo>
    
    <template id="footer_opt" inherit_id="website.snippet_options" name="My theme - Link">
        <xpath expr="//we-select[@data-variable=`footer-template`]" position="inside">
            <we-button title="My theme name shows on footer selection"
                data-customize-website-views="my_theme.my_footer_name"
                data-customize-website-variable="`My Theme`"
                data-img="/my_theme/static/src/img/_wbuilder/footer_header_opt.svg"/>
        </xpath>
    </template>

    <record id="shopper.my_footer_name" model="ir.ui.view">
        <field name="name">Shooper Footer</field>
        <field name="type">qweb</field>
        <field name="key">my_theme.my_footer_name</field>
        <field name="inherit_id" ref="website.layout" />
        <field name="mode">extension</field>
        <field name="arch" type="xml">
            <xpath expr="//div[@id=`footer`]" position="replace">
                <div id="footer" class="oe_structure oe_structure_solo" t-ignore="true" t-if="not no_footer">
                    <!-- Code goes here for snippets -->
                </div>
            </xpath>
        </field>
    </record>


</odoo>

' > footer.xml

touch header.xml
echo '<?xml version="1.0" encoding="UTF-8"?>

<!-- replace all `` to single string -->

<odoo>
    <!-- Theme Heade Options -->
    <template id="header_option" inherit_id="website.snippet_options" name="My header">
        <xpath expr="//we-select[@data-variable=`header-template`]" position="inside">
            <we-button title="My header name that shows in header selection"
                data-customize-website-views="my_theme.my_header_name"
                data-customize-website-variable="`my_theme`"
                data-img="/my_theme/static/src/img/_wbuilder/footer_header_opt.svg"/>
        </xpath>
    </template>
    
    <!--  Theame Header Layout  -->
    <record id="my_header_name" model="ir.ui.view">
        <field name="name">my_theme Header</field>
        <field name="type">qweb</field>
        <field name="key">my_theme.my_header_name</field>
        <field name="inherit_id" ref="website.layout"/>
        <field name="mode">extension</field>
        <field name="arch" type="xml">
            <xpath expr="//header//nav" position="replace">

                <-- Snippet code goes here -->

            </xpath>
        </field>
    </record>
    


</odoo>

' > header.xml
