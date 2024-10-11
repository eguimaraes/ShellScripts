import mysql.connector
from mysql.connector import Error
import subprocess
import sys
import os

def create_mysql_db_user(db_name, user_name, user_password):
    """ Create a MySQL database and user """
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",  # Root user
            password="root_password"  # Replace with actual root password
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # Step 1: Create the database
            cursor.execute(f"CREATE DATABASE {db_name}")
            print(f"Database '{db_name}' created successfully.")

            # Step 2: Create the user
            cursor.execute(f"CREATE USER '{user_name}'@'localhost' IDENTIFIED BY '{user_password}'")
            print(f"User '{user_name}' created successfully.")

            # Step 3: Grant privileges
            cursor.execute(f"GRANT ALL PRIVILEGES ON {db_name}.* TO '{user_name}'@'localhost'")
            print(f"Granted privileges on '{db_name}' to '{user_name}'.")

            # Step 4: Apply the changes with FLUSH PRIVILEGES
            cursor.execute("FLUSH PRIVILEGES")
            print("Privileges applied successfully.")

    except Error as e:
        print(f"Error: {e}")

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

def run_command(cmd):
    """ Run a shell command """
    try:
        subprocess.run(cmd, shell=True, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Command '{cmd}' failed: {e}")

def setup_wordpress(site_domain):
    """ Set up WordPress for the specified site domain """
    site_path = f"/var/www/{site_domain}"

    # Step 1: Create the website directory and set permissions
    run_command(f"sudo mkdir -p {site_path}")
    run_command(f"sudo chown -R www-data:www-data {site_path}")
    run_command(f"sudo chmod -R 755 {site_path}")

    # Step 2: Download and extract WordPress
    run_command("cd /tmp && wget https://wordpress.org/latest.tar.gz")
    run_command("tar -xvzf /tmp/latest.tar.gz -C /tmp")

    # Step 3: Copy WordPress files to the site directory
    run_command(f"sudo cp -r /tmp/wordpress/* {site_path}")
    run_command(f"sudo chown -R www-data:www-data {site_path}")
    run_command(f"sudo chmod -R 755 {site_path}")

    # Step 4: Copy the wp-config sample
    run_command(f"cd {site_path} && sudo cp wp-config-sample.php wp-config.php")
    print(f"WordPress set up for {site_domain}.")

def main():
    if len(sys.argv) != 5:
        print("Usage: python script.py <site_domain> <db_name> <db_user> <db_password>")
        sys.exit(1)

    site_domain = sys.argv[1]
    db_name = sys.argv[2]
    db_user = sys.argv[3]
    db_password = sys.argv[4]

    # Step 1: Create the MySQL database and user
    create_mysql_db_user(db_name, db_user, db_password)

    # Step 2: Set up WordPress
    setup_wordpress(site_domain)

if __name__ == "__main__":
    main()