from app import app
from flask import session
from unittest import TestCase


class TestBluebird(TestCase):

    def setUp(self):
        self.client = app.test_client()    

    def test_homepage_get(self):
        ''' test if homepage loads and contains correct info with get request'''
        resp = self.client.get('/')
        self.assertEqual(resp.status_code, 200)

        html = resp.get_data(as_text=True)
        self.assertIn('<label for="state">Where do you ski?</label>', html)  # test if input label in response

    def test_homepage_post(self):
        ''' test if homepage loads and contains correct info with post request'''
        resp = self.client.post('/', data={'state': 'Alaska'})
        self.assertEqual(resp.status_code, 200)

        html = resp.get_data(as_text=True)
        self.assertIn('<a href="/resort/255">Alyeska AK</a>', html)
