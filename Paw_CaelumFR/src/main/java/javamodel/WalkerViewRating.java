package javamodel;

public class WalkerViewRating {
	private int score;
    private String comment;
    private String ownerName;

    public WalkerViewRating(int score, String comment, String ownerName) {
        this.score = score;
        this.comment = comment;
        this.ownerName = ownerName;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }
}

