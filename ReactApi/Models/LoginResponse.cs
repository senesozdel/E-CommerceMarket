namespace ReactApi.Models
{
    public class LoginResponse
    {
        public bool AuthenticateResult { get; set; }
        public string AuthToken { get; set; }
        public DateTime AccesTokenCreationDate {  get; set; }   
    }
}
