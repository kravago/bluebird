from app import app
from flask import session
from unittest import TestCase


class TestBluebird(TestCase):

    def setUp(self):
        self.app = app.test_client()
        #self.app = app.test_client()
        app.config['TESTING'] = True
        app.config['WTF_CSRF_ENABLED'] = False

    def test_homepage_get(self):
        ''' test if homepage loads and contains correct info with get request'''
        resp = self.app.get('/')
        self.assertEqual(resp.status_code, 200)

        html = resp.get_data(as_text=True)
        self.assertIn('<label for="state">Where do you ski?</label>', html)  # test if input label in response

    def test_homepage_post(self):
        ''' test if homepage loads and contains correct info with post request'''
        resp = self.app.post('/', data={'state': 'Alaska'})
        self.assertEqual(resp.status_code, 200)

    def test_homepage_no_snow_area(self):
        resp_neg = self.app.post('/', data={'state': 'Arizona'})
        html = resp_neg.get_data(as_text=True)
        self.assertIn('No snow in your area!', html)
