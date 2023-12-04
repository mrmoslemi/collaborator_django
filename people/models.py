from utils import models


class Person(models.Model):
    name = models.CharField(max_length=255)
    about = models.TextField(blank=True)
    user = models.OneToOneField(
        to="authentication.User", related_name="person", on_delete=models.CASCADE
    )


class Team(models.Model):
    name = models.CharField()
    members = models.ManyToManyField(
        to="Person",
        related_name="teams",
        through="Membership",
    )


class Membership(models.CreatableModel):
    position = models.TextField()
    person = models.ForeignKey(
        to="Person",
        related_name="meberships",
        on_delete=models.CASCADE,
    )
    team = models.ForeignKey(
        to="Team",
        related_name="memberships",
        on_delete=models.CASCADE,
    )
