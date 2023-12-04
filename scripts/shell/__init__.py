import os
import dotenv
from sys import argv


def main():
    dotenv.load_dotenv()

    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "momemntum_django.settings")
    import django

    django.setup()
    
    command = argv[1]
    if command == "createsuperuser":
        username = argv[2]
        password = argv[3]

        from authentication.models import User

        print("Creating super user with credentials:")
        print(username, password)
        (user, created) = User.objects.get_or_create(
            username=username, defaults={"username": username}
        )
        if not created:
            print("User with username already exists")
        user.is_superuser = True
        user.is_admin = True
        user.is_active = True
        user.is_staff = True
        user.set_password(password)
        user.save()
        print("User is ready with given credentials")

    if command == "collect-authorization":
        from shell import collect_authorization

        collect_authorization.run()

    if command == "loadinstruments":
        from exchange.utils import save_tsetms_instruments

        save_tsetms_instruments()


if __name__ == "__main__":
    main()
