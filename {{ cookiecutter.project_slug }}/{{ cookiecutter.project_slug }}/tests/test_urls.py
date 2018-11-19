from django.urls import reverse


def test_admin(admin_client):
    """ Sanity check to ensure Admin loads. """
    response = admin_client.get(reverse('admin:index'))
    assert response.status_code == 200
