from django.db import models


class Item(models.Model):
    text = models.TextField(null=False, blank=False)
    done = models.BooleanField(default=False, db_index=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
