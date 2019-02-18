from storages.backends.s3boto3 import S3Boto3Storage


class MediaStorage(S3Boto3Storage):  # pylint: disable=abstract-method
    location = 'media'
    file_overwrite = False
