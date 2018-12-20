import pytest
from django.contrib.auth import get_user_model

from .. import models
from .factories import UserFactory

User = get_user_model()


def test_custom_user_model_configured():
    assert User == models.User


@pytest.mark.django_db()
def test_create_custom_user():
    # This test creates a user with our custom User model, and verifies
    # the database is configured correctly for testing.
    user = UserFactory()
    assert user.is_authenticated
