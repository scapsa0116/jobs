Tables:
-Jobs
-Users
-categories
-reviews

Validations:
-password, email unique and presence true
- reviews content presence true
- img presence true

Associations:
USER
    -has_secure_password
    -has_many :jobs
    -has_many :reviews
    -has_many :reviewed_jobs, through: :reviews, source: :jobs
    -has_many :jobs, through: :reviews, dependent: :destroy
    -has_many :categories, through: :jobs
REVIEW
    -belongs_to :user
    -belongs_to :job
JOB
    -has_many :reviews
    -belongs_to :user
    -has_many :users, through: :reviews
    -belongs_to :category
    -has_attached_file :image, styles: { medium: "300x300#"}
    -validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    -validates :image, presence: true
CATEGORY
    -has_many :jobs    


-User is abble to sign in sign out
-User is abble to creat a job profile
-User is abble to review all the Jobs posted by different users
-User is abble to edit or delete own Job profile
-user is abble to review any job profile
-user can review all the jobs reviewed on a separate page    
    
   