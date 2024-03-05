#!/usr/bin/python3
"""
This module defines a function that queries the Reddit API
and returns the number of subscribers for a given subreddit
"""
import requests


def number_of_subscribers(subreddit):
    """
    Returns the number of subscribers for a given subreddit
    or 0 if the subreddit is invalid
    """
    # Set the custom user-agent header
    headers = {'User-Agent': 'copilot/0.1.0'}
    # Send a GET request to the subreddit's JSON endpoint
    response = requests.get(
        'https://www.reddit.com/r/{}/about.json'.format(subreddit),
        headers=headers,
        allow_redirects=False
    )
    # Check if the response is valid
    if response.status_code == 200:
        # Parse the response as JSON
        data = response.json()
        # Extract the number of subscribers from the data
        subscribers = data['data']['subscribers']
        # Return the number of subscribers
        return subscribers
    else:
        # Return 0 if the response is invalid
        return 0
