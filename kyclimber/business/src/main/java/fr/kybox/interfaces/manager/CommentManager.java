package fr.kybox.interfaces.manager;

import fr.kybox.entities.Comment;

import java.util.List;

public interface CommentManager {

    List<Comment> getComments(int siteId);
}
