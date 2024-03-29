using ReactApi.Models.Datacontext;
using ReactApi.Models.Interfaces;
using ReactApi.Models.RequestModels;

namespace ReactApi.Models.Services
{
    public class UserService : IUser
    {
        MyDb db;
        public UserService(MyDb db)
        {
            this.db = db;
        }
        public Task<User> AddUserAsync(UserRequest user)
        {
          if(user != null)
            {
                User newUser = new User()
                {
                    Email = user.Email,
                    Name = user.Name,
                    Password = user.Password,
                    SurName = user.Name + Guid.NewGuid()
                };

                db.Users.Add(newUser);
                db.SaveChanges();
                return Task.FromResult(newUser);
            }
            throw new NotImplementedException();
        }

        public Task<User> GetUserByLoginAsync(UserRequest user)
        {
            if(user !=null)
            {
                var girisyapan = db.Users.FirstOrDefault(x => x.Name == user.Name && user.Password == x.Password);

                return Task.FromResult(girisyapan);
             
            }
            throw new NotImplementedException();
        }

        public Task<List<User>> GetUsersAsync()
        {
            return Task.FromResult(db.Users.ToList());
        }
    }
}
