
Discount Calculator
===================

node.js
coffeescript

django commands used
collectstatic

redis networked mapped memory

supervisor - process monitor for AMPQ worker

AMPQ Worker
===========

The AMPQ worker is used for time consuming uploads, like the price list.  After an upload action uploads a file a
task is place on the worker's task queue to digest the uploaded file into the database.

kombu_workers/worker.py
This should be set up to stay up with the process monitor 'supervisor'

If you create a softlink to kombo_worker/deploy/supervisor.ini to /etc/supervisor/apps-enabled/renesola_worker.ini
start sudo supervisorctl
and type 'reload' supervisor will keep the worker process going


coffeescript/discount_calculator/loak