class CrawlingsController < ApplicationController
  before_action :set_crawling, only: [:show, :edit, :update, :destroy]

  def index
    @crawlings = Crawling.all
  end

  def new
  end

  def create
    url = params[:url]
    response = HTTParty.get(url)
    res = Nokogiri::HTML(response.body)
    # text = res.css('title').text
    text = res.css('body').text
    headers = {
      cookie: "NNB=IGVHAG3WMU7VS; npic=Ay/S4U1UN8wawI25BVbTfeJD5E+4jfddoGJeWYZIHq7OOHqXkKA2cFKyvrFqhVcICA==; ncvid=#vid#_203.246.196.65QqbV; OTNkODIzYWUtZTYyZS00NDRjLThmNDAtNzBkNjAyMDBlNjA0_q7gpbrZ7=true; NaverSuggestUse=use%26unuse; _ga=GA1.2.579722557.1499838363; nx_ssl=2; ASID=cbf6c4410000015cc8607b950000084a; NID_AUT=uK/6tBnZc8AF60LvkIRqmxSgWgOhziGQwDhQMGcfKSORWdBZ3OAKt/DlOsrnHUq0owR1uGV1DdyOQ9LqaoXA6J7kW2JmFRApyeu6licMT+rC46CZh6mb15PQqYvlxPDk; NID_SES=AAABjub0pw8tDuJ84kn/4Mz7M5MYje1tfPd7MVDXOZSjeFCNBfYlZ5Wx523rDFaFQrc1jYPp+1Omo3osFwH9Ig90S7s3i+sO9v1+KL/vzxAy4EAqT1bN/YmmO7cJhoRutl+s1rrmsTHCB8GlYd1K+vCVOGxe7/bfBJi/+DbSWxU1NkRjadIGXYxxy6CtKJXwk++onoB5fLVa3UMmWjDSFW9qGmTo+wSfkp5d0s2TV1HypsSFqr2v8zNh+9k+OjyxhMsffnqCTOj3sWyeYgL9B+NPZU1zeK0mrBScaTkYfxpVm7wTCRqfD+kIZliUvwMcOm7NLb5/o5xnseLW+3tAl1ie6uRjN5EcLh0RmIqIC7Ytqf7fpgrtH7gIPtvxRUrhJb402zsqwCVMpPdzkeD7gNZ8dUeR7Z5JEi7ZN/VAcaG5p2BAqkNr4TDaKVGF+f2hrmtQ68IxLhUoBXRWr8Ns6kF8Fj5AOTbkRI72clo7OCspPZ5KhCdVwQBQxUkE4II72FBTHw/2nddPOsEOr6LHnHHhRLM=; ncu=8fab407063301badf31d5a4d401f6d6c9c961a80; personaconmain|hyullu15=5AAB589C6D0F0609937AA03CE2F7CAF980DF8FDA0709B5BA6849FACEE47BB9FC; personacon|hyullu15=EF19722FDCB9AB68777DE57A012E3B673CD63345145BED41DD0A40CA8A3DE28343BF263D94CBFE634650A254A13A0102A1707EC946A57BD6B0506B4D2B180AA31A6AB8423FC4A9FCA63B09DEA955B34D5778FDF078672CE293CCFC7C1F17406D62F6934B8B8D7B000DD2BE6398C6127FF44EC705DC45C8EF03270DD738D241FDA0534C67F3668ADCA25C3CD9052DEA56A1D733AFCD6EC6D7D34DFE684CF8B01926298B5CFD8FD8CA3F78D7CF5C366B75F2B5313FB4A124001A1490B8B2ADEAC2677E2F6566BD4BF0BB353CC56902FCB722F14507EC9FFB7C39709B650FEE96D6711624C98CCA6436C197B40E663595652C8761A858EB8E04BA12FBDB21E7CE1E40F056162B95E7C7A97E4FF1D072D64425944BA7DBF9250907500C4F9A681B16EDC26795ACE12BA986BA83B2BAE3F16E9FCF0A1BD5AFD920B8DEBED45329C3A6469B486BCE015A8C18767A543203FB65; nci4=facb2006175f3483df3176616c99e19a246d9474296b9a4cb7734db70005c03930d60fcf792ba49f661221ea558f3a72a3a3ae8f764320173efc59804a58ed0b447547494067427332434e69497a435f537b5e6f27575a7d6455196e62456e58176574537647707f72557d4f04070472787d7e7a030e290a3b6b69076b6a6f0370630c7d60dc; page_uid=TAhX5spVuE8ssviF5assssssscR-336042; _naver_usersession_=UwoKMhT21CyPPzAI0wSYAQ==; ncvc2=d3f71c2c3f6c47f1c33d5e6b50b5cab41459bb450e5dbb649f5961be7e5396798670bb70ad9119710386c812a60d8e74af8cbcb14760082616d470ab6e20; JSESSIONID=37E08B9221EFB3230059D3B93C4EE969"
    }
    # res = RestClient.get(url, headers)
    # response = Nokogiri::HTML(res.body)
    # text = response.css('#inbox').text
    # if url.include?('cafe')
    #   headers = {
    #   }
    #   res = RestClient.get(url, headers)
    #   text = res.body
    # end
    Crawling.create(
      url: params[:url],
      result: text
    )

    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    redirect_to root_path
  end

  def destroy
    @crawling.destroy
    redirect_to root_path
  end

  private

    def set_crawling
      @crawling = Crawling.find(params[:id])
    end

    def crawling_params
      params.require(:crawling).permit(:url, :result)
    end
end
