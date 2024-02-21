#!/usr/bin/python3
import requests
import sys


def get_employee_progress(employee_id):
    """Returns a dictionary with the employee progress data"""
    # Define the query parameters as a dictionary
    params = {'userId': employee_id}
    # Send a GET request to the API with the params argument
    response = requests.get('https://jsonplaceholder.typicode.com/todos',
                            params=params)
    # Parse the JSON response into a Python object
    response_json = response.json()
    # Extract the employee name from the response object
    employee_name = response_json[0].get('user').get('name')
    # Filter the tasks list to get only the done tasks
    done_tasks = [task for task in response_json if task['completed']]
    # Get the number of done tasks and the total number of tasks
    number_of_done_tasks = len(done_tasks)
    total_number_of_tasks = len(response_json)
    # Get the titles of the done tasks
    done_titles = [task['title'] for task in done_tasks]
    # Return a dictionary with the employee progress data
    return {
        'employee_name': employee_name,
        'number_of_done_tasks': number_of_done_tasks,
        'total_number_of_tasks': total_number_of_tasks,
        'done_titles': done_titles
    }


if __name__ == "__main__":
    # Get the employee ID from the command-line argument
    employee_id = sys.argv[1]
    # Call the function with the employee ID and store the result
    data = get_employee_progress(employee_id)
    # Print the data in the required format
    print(
        "Employee {} is done with tasks({}/{})".format(
            data['employee_name'],
            data['number_of_done_tasks'],
            data['total_number_of_tasks']
        ) + ":"
    )
    for title in data['done_titles']:
        print("\t {}".format(title))
